import 'package:flutter/material.dart';
import 'package:test1/ui/widgets/fetch_button.dart';
import 'package:test1/ui/widgets/refresh_button.dart';
import 'package:test1/ui/widgets/user_data_output.dart';
import '../ui/widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final OutlineInputBorder _greenBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(15),
  //   borderSide: const BorderSide(color: Colors.green),
  // );

  late final TextEditingController _userIdController;

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
          children: [
            InputField(controller: _userIdController),
            FetchButton(controller: _userIdController),
            const SizedBox(height: 10),
            const UserDataOutput(),
          ],
        ),
      ),
      floatingActionButton: const RefreshButton(),
    );
  }
}

