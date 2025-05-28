import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class WidgetCategoryToggle extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const WidgetCategoryToggle({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: DefaultStyles.medium16Black),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
