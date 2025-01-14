import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;

  const ProfileImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
