import 'package:flutter/material.dart';
import 'package:flutter_webpage/common_widget/text.dart';

class HomeCard extends StatelessWidget {
  final VoidCallback ontap;

  final String tittle, discrition;
  const HomeCard(
      {super.key,
      required this.ontap,
      required this.tittle,
      required this.discrition});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 240, 235, 235),
                blurRadius: 3.0,
                spreadRadius: 3),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://img.staticmb.com/mbcontent/images/uploads/2023/1/Small-Garden-Landscaping-Ideas.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                blackText(tittle, 20, fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 10,
                ),
                blackText(
                  discrition,
                  16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
