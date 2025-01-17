import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigoe_detection_app/features/presentation/widgets/bottom_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gigoe_detection_app/features/presentation/bloc/img_response_bloc.dart';
import 'package:gigoe_detection_app/features/presentation/bloc/classification_bloc.dart';
import 'package:gigoe_detection_app/features/presentation/pages/result_detection_page.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  late ImagePicker _imagePicker;

  final Map<String, String?> _imageFiles = {
    'Gigi Depan': null,
    'Gigi Kanan': null,
    'Gigi Kiri': null,
    'Gigi Atas': null,
    'Gigi Bawah': null,
  };

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _uploadImageFromGallery(String title) async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFiles[title] = pickedImage.path;
      }
    });
  }

  Future<void> _takeImageFromCamera(String title) async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _imageFiles[title] = pickedImage.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          "Tambah Foto",
          style: GoogleFonts.poppins(
              color: const Color(0xffffffff),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xff2E4F4F),
                Color(0xff0E8388),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomNavBar(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildImageCard(
                    'Gigi Depan',
                    'PHOTO 1 OF 5',
                    _imageFiles['Gigi Depan'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildImageCard(
                    'Gigi Kanan',
                    'PHOTO 2 OF 5',
                    _imageFiles['Gigi Kanan'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildImageCard(
                    'Gigi Kiri',
                    'PHOTO 3 OF 5',
                    _imageFiles['Gigi Kiri'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildImageCard(
                    'Gigi Atas',
                    'PHOTO 4 OF 5',
                    _imageFiles['Gigi Atas'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildImageCard(
                    'Gigi Bawah',
                    'PHOTO 5 OF 5',
                    _imageFiles['Gigi Bawah'],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xffffffff),
                      backgroundColor: const Color(0xff0E8388),
                      minimumSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.read<ImgResponseBloc>().add(
                            OnCombinedImgResponse(
                              frontImage: _imageFiles['Gigi Depan']!,
                              rightImage: _imageFiles['Gigi Kanan']!,
                              leftImage: _imageFiles['Gigi Kiri']!,
                              upperImage: _imageFiles['Gigi Atas']!,
                              lowerImage: _imageFiles['Gigi Bawah']!,
                            ),
                          );
                      context.read<ClassificationBloc>().add(
                            OnCombinedClassification(
                              frontImage: _imageFiles['Gigi Depan']!,
                              rightImage: _imageFiles['Gigi Kanan']!,
                              leftImage: _imageFiles['Gigi Kiri']!,
                              upperImage: _imageFiles['Gigi Atas']!,
                              lowerImage: _imageFiles['Gigi Bawah']!,
                            ),
                          );
                    },
                    child: BlocConsumer<ImgResponseBloc, ImgResponseState>(
                      listener: (context, state) {
                        if (state is CombinedImgResponseState) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ResultDetectionPage();
                              },
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ImgResponseLoading) {
                          return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          );
                        }
                        return Center(
                          child: Text(
                            "PROSES",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(
    String title,
    String subtitle,
    String? imageFile,
  ) {
    return Container(
      height: 305,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                subtitle,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 180,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(imageFile),
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(Icons.image_not_supported_rounded, size: 30),
          ),
          const SizedBox(height: 10),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _uploadImageFromGallery(title);
                  },
                  icon: const Icon(
                    Icons.upload_rounded,
                    size: 25,
                  ),
                  label: Text(
                    "Upload",
                    style: GoogleFonts.poppins(),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    foregroundColor: const Color(0xffffffff),
                    backgroundColor: const Color(0xff0E8388),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _takeImageFromCamera(title);
                  },
                  icon: const Icon(
                    Icons.photo_camera_rounded,
                    size: 25,
                  ),
                  label: Text(
                    "Camera",
                    style: GoogleFonts.poppins(),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    foregroundColor: const Color(0xffffffff),
                    backgroundColor: const Color(0xff2E4F4F),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
