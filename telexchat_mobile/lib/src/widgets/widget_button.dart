import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class WidgetButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const WidgetButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.decoration,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration:
            decoration ??
            BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
        child: Center(
          child: Text(title, style: textStyle ?? DefaultStyles.medium16White),
        ),
      ),
    );
  }
}
