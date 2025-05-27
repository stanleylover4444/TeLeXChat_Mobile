import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class WidgetAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;

  final List<Widget>? actions;

  const WidgetAppbar({
    super.key,
    required this.title,
    this.isBack = true,
    this.onBackPressed,
    this.backgroundColor,

    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      centerTitle: true,
      // Title ở giữa
      leading: isBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: isBack,
      title: Text(title, style: DefaultStyles.medium18Black),
      actions: actions,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(1),
      //   child: Container(color: AppColors.gray, height: 1),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
