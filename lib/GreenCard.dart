import 'package:flutter/material.dart';
import 'model.dart';
import 'textcombo.dart';

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
        width: 400,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.profileImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComboWidget(leftText: "Name", rightText: user.name),
                  TextComboWidget(leftText: "User ID", rightText: user.userId.toString()),
                  TextComboWidget(leftText: "Age", rightText: user.age.toString()),
                  TextComboWidget(leftText: "Profession", rightText: user.profession)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
