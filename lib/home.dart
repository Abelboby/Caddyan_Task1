import 'package:flutter/material.dart';
import 'model.dart';
import 'green_card.dart';
import 'service.dart';

enum HomeState { none, loading, error, success }

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
  HomeState currentState = HomeState.none;

  Future<void> fetchUserData() async {
    final userInput = userId.text.trim();
    if (userInput.isEmpty) {
      setState(() {
        apierror = "Please enter a valid user ID";
        currentState = HomeState.error;
      });
      return;
    }
    if (int.tryParse(userInput) == null) {
      setState(() {
        apierror = "User ID must be a number";
        currentState = HomeState.error;
      });
      return;
    }

    setState(() {
      currentState = HomeState.loading;
      apierror = null;
      user = null;
    });
    final apiresponse = await Service().getUserInfo(userId.text);
    setState(() {
      if (apiresponse.error == null) {
        user = apiresponse.data?.user;
        currentState = HomeState.success;
      } else {
        apierror = apiresponse.error;
        currentState = HomeState.error;
      }
    });
  }

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
              onPressed: fetchUserData,
              child: const Text('Fetch User Data'),
            ),
            const SizedBox(height: 20),
            _buildStateUI(),
          ],
        ),
      ),
    );
  }

  Widget _buildStateUI() {
    switch (currentState) {
      case HomeState.loading:
        return const CircularProgressIndicator();

      case HomeState.error:
        return Text(
          apierror!,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
        );

      case HomeState.success:
        return GreenCard(user: user!);

      case HomeState.none:
        return const Text(
          "Enter a user ID and click to get the user details",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        );
    }
  }
}
