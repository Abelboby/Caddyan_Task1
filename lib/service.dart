import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class Service {
  Future<ActorModel> getUserInfo(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userId'));
      if (response.statusCode == 200) {
        return ActorModel.fromJson(jsonDecode(response.body));
      } else {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['data'] == null) {
          throw 'User not found';
        }
        else {
          throw 'Something went wrong';
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
