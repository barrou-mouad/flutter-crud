import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_test/models/personne.dart';

class ApiService {
  // ------------------------ GET -------------------------------------------
  Future<List<Personne>> getUsers() async {
    late List<Personne> list = [];
    var url = Uri.parse("http://192.168.180.33:8000/api/personnes");
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

  //---------------------------  POST   -----------------------------------
  Future<void> saveUsers(Personne p) async {
    var url = Uri.parse("http://192.168.180.33:8000/api/personne");
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nom': p.nom,
          'prenom': p.prenom,
          'age': p.age.toString()
        }));

    if (response.statusCode == 200) {
      print("bien fait");
    } else {
      throw ("Erreur ....");
    }
  }
}
