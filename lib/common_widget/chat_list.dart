import 'package:flutter/material.dart';
import 'package:flutter_webpage/common_widget/text.dart';

class DrawerList extends StatelessWidget {
  final String tittle, subtittle;
  final String image;
  final VoidCallback? onpress;
  //final Color color;
  const DrawerList({
    super.key,
    required this.tittle,
    required this.onpress,
    required this.subtittle,
    required this.image,

    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // shape: RoundedRec
      // tangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   side: const BorderSide(
      //     color: Colors.black,
      //   ),
      // ),
      contentPadding: EdgeInsets.zero,
      onTap: onpress,
      horizontalTitleGap: 27,
      leading: CircleAvatar(
        child: Image.network(image, fit: BoxFit.fill),
      ),

      //color: color,
      // color: Colors.black,

      title: blackText(tittle, 16, fontWeight: FontWeight.w600),
      subtitle: blackText(subtittle, 14, fontWeight: FontWeight.w400),

      trailing: blackText(
        '08.20',
        10,
      ),
    );
  }
}
