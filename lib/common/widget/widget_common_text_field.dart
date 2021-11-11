import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initValue;
  final String? hint;
  final TextAlign? textAlign;
  final int? minLines;
  final int? maxLines;
  final bool? autoFocus;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTextField({
    Key? key,
    this.controller,
    this.hint,
    this.textAlign,
    this.minLines,
    this.maxLines, this.autoFocus, this.initValue, this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines == 1 ? 28 : null,
      child: TextFormField(
        initialValue: initValue,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        autofocus: autoFocus ?? false,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent)),
            hintText: hint),
      ),
    );
  }
}
