import 'package:flutter/material.dart';
import '../models/actor_model.dart';
import '../services/api_service.dart';

enum HomeState { none, loading, error, success }

class UserProvider extends ChangeNotifier {
  User? user;
  String? apiError;
  final TextEditingController userIdController = TextEditingController();
  HomeState currentState = HomeState.none;
  final _service = Service();

  Future<void> fetchUserData() async {
    if (!_validateUserInput() || currentState == HomeState.loading) return;
    _setState(HomeState.loading);

    try {
      final apiResponse = await _service.getUserInfo(userIdController.text.trim());
      // print(apiResponse);
      // print(apiResponse.success);
      // print(userIdController.text.trim());

      if (apiResponse.success && apiResponse.data != null) {
        user = apiResponse.data!.user;
        _setState(HomeState.success);
      } else {
        apiError = apiResponse.error;
        _setState(HomeState.error);
      }
    } catch (e) {
      apiError = e.toString();
      _setState(HomeState.error);
    }
  }

  bool _validateUserInput() {
    if (userIdController.text.isEmpty) {
      apiError = "Please enter a valid user ID";
      _setState(HomeState.error);
      return false;
    }

    if (int.tryParse(userIdController.text.trim()) == null) {
      apiError = "User ID must be a number";
      _setState(HomeState.error);
      return false;
    }

    return true;
  }

  void _setState(HomeState state) {
    currentState = state;
    notifyListeners();
  }

  void reset() {
    user = null;
    apiError = null;
    currentState = HomeState.none;
    userIdController.clear();
    notifyListeners();
  }
}
