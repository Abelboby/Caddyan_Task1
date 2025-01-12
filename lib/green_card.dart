import 'package:flutter/material.dart';
import 'actor_model.dart';
import 'text_combo.dart';

class GreenCard extends StatelessWidget {
  final User user;

  const GreenCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 150,
        width: 450,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _buildProfileImage(),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComboWidget(
                    label: "Name",
                    value: user.name,
                  ),
                  TextComboWidget(
                    label: "User ID",
                    value: user.userId.toString(),
                  ),
                  TextComboWidget(
                    label: "Age",
                    value: user.age.toString(),
                  ),
                  TextComboWidget(
                    label: "Profession",
                    value: user.profession,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return SizedBox(
      width: 150,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user.profileImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
