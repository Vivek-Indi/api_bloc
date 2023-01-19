import 'dart:convert';

import 'package:api_bloc/models/user_model.dart';
import 'package:http/http.dart';

class UserRepo {
  String api = "https://reqres.in/api/users?delay=2";
  Future<List<UserModel>> fetchUsers() async {
    Response res = await get(Uri.parse(api));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result
          .map(((e) => UserModel.fromJson(e)))
          .cast<UserModel>()
          .toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
