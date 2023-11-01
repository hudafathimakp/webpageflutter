// import 'package:flutter/material.dart';

// class TextChatFeild extends StatelessWidget {
//   final String hint;
//   // final VoidCallback prefixclick, sufixclick;
//   const TextChatFeild(
//       {super.key,
//       required this.hint,
//       // required this.prefixclick,
//       // required this.sufixclick
//       });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         // prefixIcon: IconButton(
//         //   onPressed: prefixclick,
//         //   icon: svgWidget("asset/svg/attach.svg"),
//         // ),
//         // suffixIcon: IconButton(
//         //     onPressed: sufixclick, icon: svgWidget("asset/svg/simile.svg")),
//         fillColor: const Color(0xFFF3F3F3),
//         filled: true,
//         hintText: hint,
//         hintStyle: const TextStyle(
//           fontSize: 12,
//           color: Color(0xffB6B6B6),
//           fontFamily: "Manrope",
//           fontWeight: FontWeight.w500,
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xffEEF1F6)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xffEEF1F6)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextChatFeild extends StatelessWidget {
  final String hintText;
  final bool? isEnable;
  final bool? inputFormate;
  final bool? isCenterText;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final String? labelText;
  final Function? onChanged;
  final Widget? suffixIcon;
  final int? maxLengthLimit;
  final TextInputType? textInputType;
  final Function? onTap;
  final bool obscureText;
  final Color? fillcolor;
  final Color? hintcolor;
  final bool isDense;
  final double horizotalPadding;
  final TextEditingController? textEditingController;
  final double? fontSize;
  final double borderRadius;
  final bool readonly;
  final int lines;
  const TextChatFeild(
      {super.key,
      required this.hintText,
      this.isEnable,
      this.inputFormate,
      this.isCenterText,
      this.validator,
      this.prefixIcon,
      this.labelText,
      this.onChanged,
      this.suffixIcon,
      this.maxLengthLimit,
      this.textInputType,
      this.onTap,
      this.obscureText = false,
      this.horizotalPadding = 10,
      this.isDense = false,
      this.textEditingController,
      this.fontSize,
      this.readonly = false,
      this.lines = 1,
      this.borderRadius = 20,
      this.fillcolor = Colors.white,
      this.hintcolor = const Color(0xFF9A9A9A)});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: lines,
      readOnly: readonly,
      validator: validator,
      obscureText: obscureText,
      controller: textEditingController,
      enabled: isEnable ?? true,
      inputFormatters: inputFormate == null
          ? null
          : [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(maxLengthLimit)
            ],
      textAlign: isCenterText == null ? TextAlign.start : TextAlign.center,
      onTap: onTap == null
          ? null
          : () {
              onTap!();
            },
      onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      style: TextStyle(fontSize: fontSize ?? 15),
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF3F3F3),
        // contentPadding:
        //     EdgeInsets.symmetric(vertical: 5, horizontal: horizotalPadding),
        hintStyle: TextStyle(fontSize: 14, color: hintcolor),
        labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        filled: true,
        isDense: isDense,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF1F6), width: .5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF1F6), width: .5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF1F6), width: .5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
