import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCharts extends StatefulWidget {
  const CustomCharts({super.key});

  @override
  State<CustomCharts> createState() => _CustomChartsState();
}

class _CustomChartsState extends State<CustomCharts> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 360,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Statistik",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Hasil Perhitungan Pengalaman Karies dalam\nbentuk Grafik berdasarkan jumlah Pasien,\nWilayah dan gender.",
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: Container(
            height: 190,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/diagram.png',
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

          // child: SizedBox(
          //   width: 300, // Lebar yang Anda inginkan
          //   height: 200, // Tinggi yang Anda inginkan
          //   child: LineChart(
          //     LineChartData(
          //       gridData: const FlGridData(show: false),
          //       titlesData: const FlTitlesData(show: false),
          //       borderData: FlBorderData(
          //         show: true,
          //         border: Border.all(
          //           color: const Color(0xff37434d),
          //           width: 1,
          //         ),
          //       ),
          //       minX: 0,
          //       maxX: 6,
          //       minY: 0,
          //       maxY: 6,
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: [
          //             const FlSpot(0, 3),
          //             const FlSpot(1, 1),
          //             const FlSpot(2, 4),
          //             const FlSpot(3, 2),
          //             const FlSpot(4, 5),
          //             const FlSpot(5, 1),
          //           ],
          //           isCurved: true,
          //           color: Colors.blue,
          //           dotData: const FlDotData(show: false),
          //           belowBarData: BarAreaData(show: false),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // child: SizedBox(
          //   width: 500, // Lebar yang sesuai
          //   height: 300, // Tinggi yang sesuai
          //   child: BarChart(
          //     BarChartData(
          //       gridData: const FlGridData(show: true),
          //       titlesData: const FlTitlesData(show: true),
          //       borderData: FlBorderData(
          //         show: true,
          //         border: Border.all(
          //           color: const Color(0xff37434d),
          //           width: 1,
          //         ),
          //       ),
          //       groupsSpace: 10, // Spasi antara grup-grup batang
          //       barGroups: [
          //         BarChartGroupData(
          //           x: 0,
          //           barsSpace: 4,
          //           barRods: [
          //             BarChartRodData(
          //               y: 5, // Jumlah pasien laki-laki kecamatan 1
          //               colors: [Colors.blue], toY: null,
          //             ),
          //             BarChartRodData(
          //               y: 7, // Jumlah pasien perempuan kecamatan 1
          //               colors: [Colors.pink],
          //             ),
          //           ],
          //         ),
          //         // Lanjutkan dengan menambahkan data untuk kecamatan lainnya
          //         // ...
          //       ],
          //     ),
          //   ),
          // ),
 