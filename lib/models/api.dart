import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_test/models/personne.dart';

class ApiService {
  Future<List<Personne>> getUsers() async {
    late List<Personne> list = [];
    var url = Uri.parse("http://192.168.1.111:8000/api/personnes");
    var response = await http.get(url);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // return  response.body);
      for (var i in data) {
        list.add(Personne.fromJson(i));
      }
      return list;
    } else {
      throw ("Erreur ....");
    }
  }
}
