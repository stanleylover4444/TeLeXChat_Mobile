import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class TabItem {
  final IconData icon;
  final String label;

  TabItem({required this.icon, required this.label});
}

class WidgetBottomTab extends StatelessWidget {
  final List<TabItem> tabs;
  final int currentIndex;
  final Function(int) onTap;

  const WidgetBottomTab({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: tabs.asMap().entries.map((entry) {
              int index = entry.key;
              TabItem tab = entry.value;
              bool isSelected = index == currentIndex;
              return Expanded(
                child: CustomTabItem(
                  icon: tab.icon,
                  label: tab.label,
                  isSelected: isSelected,
                  onTap: () => onTap(index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CustomTabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTabItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  icon,
                  size: 22,
                  color: isSelected ? AppColors.primary700 : Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: DefaultStyles.medium12Black.copyWith(
                  color: isSelected ? AppColors.primary700 : Colors.grey,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
