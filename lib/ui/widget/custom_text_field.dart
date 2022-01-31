import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  final double? rightPadding;
  final void Function(String)? onChanged;
  final bool isDense;
  final FocusNode? focusNode;
  final bool? obscure;
  final bool? isFull;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({Key? key,
    this.hintText,
    this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.rightPadding,
    this.onChanged,
    this.isDense = false,
    this.focusNode,
    this.obscure,
    this.isFull,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      obscureText: obscure != null && obscure == true ? true : false,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      cursorColor: Colors.black,
      cursorWidth: 1,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        height: 1.48,
      ),
      decoration: InputDecoration(
        isDense: isDense,
        filled: true,
        fillColor: Colors.grey,
        contentPadding: EdgeInsets.only(
          left: 20,
          right: rightPadding ?? 20,
          top: isDense ? 50 : 20,
          bottom: isDense ? 50 : 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    );
  }
//
}