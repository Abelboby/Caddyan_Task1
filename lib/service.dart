import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'model.dart';

class Service {
  Future<ActorModel> getUserInfo(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userId'));
      final decodedResponse = jsonDecode(response.body);
      return ActorModel.fromJson(decodedResponse);
    } on SocketException {
      throw 'No internet connection. Please check your network.';
    } catch (e) {
      // print(e);
      // if (e.toString().contains('No user found')) {
      //   throw 'User not found';
      // } else {
        throw 'Something went wrong.';
      //}
    }
  }
}

