import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class Service {
  Future<Welcome> getUserInfo(String userId) async {
    final response = await http.get(Uri.parse(
        'https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userId'));
    if (response.statusCode == 200) {
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      final decodedResponse = jsonDecode(response.body);
      throw decodedResponse['error'] ?? 'Something went wrong';
    }
  }
}
