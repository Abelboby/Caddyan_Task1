import 'package:flutter/material.dart';
import 'actor_model.dart';
import 'green_card.dart';
import 'api_service.dart';

enum HomeState {
  none,
  loading,
  error,
  success,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final OutlineInputBorder _greenBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.green),
  );

  late final TextEditingController _userIdController;
  User? _user;
  String? _apiError;
  HomeState _currentState = HomeState.none;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController();
  }

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _fetchUserData() async {
    final userInput = _userIdController.text.trim();

    if (!_validateUserInput(userInput) || _currentState == HomeState.loading) {
      return;
    }

    setState(() {
      _currentState = HomeState.loading;
      _apiError = null;
      _user = null;
    });

    try {
      final apiResponse = await Service().getUserInfo(userInput);
      setState(() {
        if (apiResponse.success && apiResponse.data != null) {
          _user = apiResponse.data!.user;
          _currentState = HomeState.success;
        } else {
          _apiError = apiResponse.error;
          _currentState = HomeState.error;
        }
      });
    } catch (e) {
      setState(() {
        _apiError = e.toString();
        _currentState = HomeState.error;
      });
    }
  }

  bool _validateUserInput(String input) {
    if (input.isEmpty) {
      setState(() {
        _apiError = "Please enter a valid user ID";
        _currentState = HomeState.error;
      });
      return false;
    }

    if (int.tryParse(input) == null) {
      setState(() {
        _apiError = "User ID must be a number";
        _currentState = HomeState.error;
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: SizedBox(
                width: 450,
                child: TextField(
                  controller: _userIdController,
                  decoration: InputDecoration(
                    enabledBorder: _greenBorder,
                    focusedBorder: _greenBorder,
                    hintText: 'Enter the User ID',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: _fetchUserData,
              child: const Text('Fetch User Data'),
            ),
            const SizedBox(height: 10),
            _buildStateUI(),
          ],
        ),
      ),
    );
  }

  Widget _buildStateUI() {
    if (_currentState == HomeState.loading) return const CircularProgressIndicator();
    
    if (_currentState == HomeState.error) {
      return Text(
        _apiError!,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
      );
    }
    if (_currentState == HomeState.success) return GreenCard(user: _user!);
    return const Text(
      "Enter a valid user ID and click to get the user details", 
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
