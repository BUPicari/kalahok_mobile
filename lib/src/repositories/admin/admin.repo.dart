import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kalahok_mobile/config/api.config.dart';
import 'package:kalahok_mobile/src/models/admin.model.dart';

class AdminRepository {
  // Future<List<Admin>?> getAdmins() async {
  Future<List<Admin>?> getAdmins() async {
    try {
      // var url = Uri.parse('${ApiConfig.baseUrl}/surveys');
      var url = Uri.parse('${ApiConfig.baseUrl}/users');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // log(json.decode(response.body));
        // log(json.encode(response.body));
        // log(jsonDecode(response.body));
        List<Admin> model = adminModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
