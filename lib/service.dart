import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class Service {
  Future<ActorModel> getUserInfo(String userId) async {
    final response = await http.get(Uri.parse(
        'https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userId'));

    if (response.statusCode == 404) {
      throw 'User not found';
    }
    try {
      return ActorModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
