import 'package:flutter/material.dart';
import 'package:gigoe_detection_app/features/presentation/widgets/custom_img_slider.dart';
import 'package:gigoe_detection_app/features/presentation/widgets/custom_charts.dart';
import 'package:gigoe_detection_app/features/presentation/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      body: Stack(
        children: [
          CustomImgSlider(),
          const CustomCharts(),
          const CustomAppBar(),
        ],
      ),
    );
  }
}
