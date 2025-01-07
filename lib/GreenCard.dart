import 'package:flutter/material.dart';
import 'model.dart';

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
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}'),
                  Text('User ID: ${user.userId}'),
                  Text('Age: ${user.age}'),
                  Text('Profession: ${user.profession}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
