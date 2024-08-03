import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
    required this.textEditingController,
    this.iconData,
    this.assetReference,
    required this.labelString,
    required this.isObscure,
  });

  final TextEditingController textEditingController;
  final IconData? iconData;
  final String? assetReference;
  final String labelString;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelString,
        prefixIcon: iconData != null ? Icon(iconData): Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(assetReference!, width: 10,),
        ),
      ),
    );
  }
}
