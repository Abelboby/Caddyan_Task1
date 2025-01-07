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
                  textCombo("Name", user.name),
                  textCombo("User ID", user.userId.toString()),
                  textCombo("Age", user.age.toString()),
                  textCombo("Profession", user.profession)
                ],
              ),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget textCombo(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            leftText,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(
          rightText,
          style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

}
