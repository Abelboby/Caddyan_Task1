import 'package:flutter/material.dart';
import '../models/actor_model.dart';
import '../services/api_service.dart';

enum HomeState { none, loading, error, success }

class UserProvider extends ChangeNotifier {
  User? user;
  String? apiError;
  HomeState currentState = HomeState.none;
  final _service = Service();

  Future<void> fetchUserData(String userInput) async {
    if (!_validateUserInput(userInput) || currentState == HomeState.loading) return;
    _setState(HomeState.loading);

    try {
      final apiResponse = await _service.getUserInfo(userInput);

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

  bool _validateUserInput(String input) {
    if (input.isEmpty) {
      apiError = "Please enter a valid user ID";
      _setState(HomeState.error);
      return false;
    }

    if (int.tryParse(input) == null) {
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
    notifyListeners();
  }
}
