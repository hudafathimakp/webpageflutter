import 'package:flutter/material.dart';

class LoginFeild extends StatelessWidget {
  final String hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  // final IconData? prefixIcon;
  final TextInputType? keytype;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final IconData? suffixIcon;
  const LoginFeild(
      {super.key,
      required this.hintText,
      this.isEnable,
      this.validator,
      this.keytype,
      this.prefixIcon,
      this.textInputType,
      required this.obscureText,
      this.suffixIconClick,
      this.textEditingController,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      validator: validator,
      style: const TextStyle(
          fontSize: 17, letterSpacing: 1, fontWeight: FontWeight.w500),
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDEDEDE)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDEDEDE)),
          ),
          hintStyle: const TextStyle(
            color: Color(0xffDEDEDE),
            fontSize: 16,
            fontFamily: "Manrope",
            fontWeight: FontWeight.w500,
          ),
          hintText: hintText),
    );
  }
}
