import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class CustomTextInput extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;

  const CustomTextInput({
    Key? key,
    required this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.onChanged,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(widget.label, style: DefaultStyles.medium14Black),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: widget.hint,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: AppColors.primary700, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Colors.red.shade700, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Colors.red.shade700, width: 1),
            ),
            errorText: widget.errorText,
            errorStyle: TextStyle(fontSize: 13, color: Colors.red.shade700),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 18,
                    ),
                    onPressed: _toggleObscure,
                  )
                : null,
          ),
          style: DefaultStyles.regular14Black,
        ),
      ],
    );
  }
}
