import 'package:flutter/material.dart';
import 'package:sot/constants/style.dart';

class CustomTextButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final bool isFullWidth;
  final bool isBold;
  final double? size;

  const CustomTextButton(
      {Key? key,
      this.color = kPrimaryColor,
      required this.onPressed,
      this.size,
      this.isFullWidth = true,
      this.isBold = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFullWidth
        ? SizedBox(
            width: double.infinity,
            child: buildBody(context),
          )
        : buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: bodyMedium!.copyWith(
          color: color,
          fontSize: size ?? bodyMedium.fontSize,
          fontWeight: isBold ? FontWeight.bold : bodyMedium.fontWeight,
        ),
      ),
    );
  }
}
