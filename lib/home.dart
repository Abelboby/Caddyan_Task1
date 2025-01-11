import 'package:flutter/material.dart';
import 'model.dart';
import 'greencard.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final OutlineInputBorder greenBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.green),
  );

  late final TextEditingController userId;
  User? user;
  String? apierror;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userId = TextEditingController();
  }

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: TextField(
                  controller: userId,
                  decoration: InputDecoration(
                    enabledBorder: greenBorder,
                    focusedBorder: greenBorder,
                    hintText: 'Enter the User ID',
                  ),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () async {
                if (userId.text.trim().isEmpty) {
                  setState(() {
                    apierror = "Please enter a user ID";
                    user = null;
                  });
                  return;
                }
                setState(() {
                  isLoading = true;
                  apierror = null;
                  user = null;
                });
                try {
                  final apiresponse = await Service().getUserInfo(userId.text);
                  // print(apiresponse);
                  setState(() {
                    if (apiresponse.error == null) {
                      user = apiresponse.data.user;
                    } else {
                      apierror = apiresponse.error;
                    }
                  });
                } catch (e) {
                  setState(() {
                    apierror = e.toString();
                  });
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: const Text('Fetch User Data'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : apierror != null
                    ? Text(
                        apierror!,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w700),
                      )
                    : user != null
                        ? GreenCard(user: user!)
                        : const Text(
                            "Enter a user ID and click to get the user details",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
          ],
        ),
      ),
    );
  }
}
