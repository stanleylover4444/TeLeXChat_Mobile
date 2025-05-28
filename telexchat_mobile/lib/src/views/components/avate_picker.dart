import 'package:flutter/material.dart';

class AvatarPicker extends StatelessWidget {
  final VoidCallback onPressed;
  final String? imageUrl;

  const AvatarPicker({super.key, required this.onPressed, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final imageProvider = (imageUrl != null && imageUrl!.isNotEmpty)
        ? NetworkImage(imageUrl!)
        : AssetImage('lib/src/assets/images/ic_app.jpg') as ImageProvider;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Avatar
          Container(
            width: 94,
            height: 94,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          // Icon máy ảnh
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(6),
              child: Icon(Icons.camera_alt, color: Colors.black, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}
