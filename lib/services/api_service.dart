import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/actor_model.dart';

class Service {
  static const String _baseUrl = 'https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/';
  Future<ActorModel> getUserInfo(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$userId'),
      );

      final decodedResponse = jsonDecode(response.body);

      if (decodedResponse['data'] == null) {
        return ActorModel(
          success: false,
          data: null,
          error: 'User not found',
        );
      }

      return ActorModel.fromJson(decodedResponse);
    } on SocketException {
      return ActorModel(
        success: false,
        data: null,
        error: 'No internet connection. Please check your network.',
      );
    } catch (e) {
      return ActorModel(
        success: false,
        data: null,
        error: e.toString(),
      );
    }
  }
}
