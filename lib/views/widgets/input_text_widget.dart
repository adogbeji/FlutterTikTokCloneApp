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
    return const Placeholder();
  }
}
