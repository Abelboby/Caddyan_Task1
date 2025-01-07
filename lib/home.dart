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
  final TextEditingController userId = TextEditingController();
  User? user;
  String? apierror;
  bool isLoading = false;

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
                setState(() {
                  isLoading = true;
                  apierror = null;
                  user = null;
                });
                try {
                  final apiresponse = await Service().getUserInfo(userId.text);
                  print(apiresponse);
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
            // if (isLoading)
            //   const CircularProgressIndicator()
            // else if (apierror != null)
            //   Padding(
            //     padding: const EdgeInsets.all(5.0),
            //     child: Text(
            //       apierror!,
            //       style: const TextStyle(
            //           color: Colors.red, fontWeight: FontWeight.w700),
            //     ),
            //   )
            // else if (user != null)
            //   GreenCard(user: user!),
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
                                color: Colors.green, fontWeight: FontWeight.w700),
                          ),
          ],
        ),
      ),
    );
  }
}
