// lib/src/pages/new_feature/new_feature_view.dart
import 'package:flutter/material.dart';

class NewFeatureView extends StatelessWidget {
  const NewFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tính năng mới"), centerTitle: true),
      body: const Center(child: Text("Đây là màn tính năng mới")),
    );
  }
}
