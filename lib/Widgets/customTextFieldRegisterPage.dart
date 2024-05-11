import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';

class customTextFieldRegsiterPage extends StatelessWidget {
  final TextEditingController? textEditingController;
  bool? isSecure = false;
  final TextInputType? textInputType;
  final Widget? widget;
  bool? enabledEdit = true;
  final String? hint;

  customTextFieldRegsiterPage({
    super.key,
    this.enabledEdit,
    this.isSecure,
    this.textEditingController,
    this.textInputType,
    this.hint,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: escalate.cyanColor.withAlpha(70),
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: isSecure!,
        cursorColor: escalate.cyanColor,
        keyboardType: textInputType,
        enabled: enabledEdit,
        decoration: InputDecoration(
          filled: true,
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(9),
          isDense: true,
          suffixIcon: widget,
          suffixStyle: TextStyle(color: escalate.cyanColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: escalate.blueColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
