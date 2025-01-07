import 'package:flutter/material.dart';
import 'package:test1/model.dart';

import 'GreenCard.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController userId = TextEditingController();
  User? user;
  String? apierror;
  @override
  void dispose() {
    userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Call Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20  ),
                child: TextField(
                  controller: userId,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    //   borderSide: const BorderSide(color: Colors.yellow),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    hintText: 'Enter the User ID',
                  ),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
              print(userId.text);
              final apiresponse = await Service().getUserInfo(userId.text);
              if(apiresponse.error == null) {
                setState(() {
                  user = apiresponse.data.user;
                  apierror = apiresponse.error;
                });
                print(apiresponse.data.user.name);
              } else {
                print(apiresponse.error);
              }
            }, child: const Text('Fetch User Data')),
            if(user != null) 
              GreenCard(user: user!),
          ],
          
        ),
      ),
    );
  }
}
