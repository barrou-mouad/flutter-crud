import 'package:flutter/material.dart';

import 'package:projet_test/models/api.dart';
import 'package:projet_test/models/personne.dart';
import 'package:projet_test/screens/about.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late Future<List<Personne>> list;
  @override
  void initState() {
    list = ApiService().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: FutureBuilder<List<Personne>>(
            future: list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 16),
                            width: double.infinity,
                            child: Card(
                              elevation: 5,
                              child: Text(
                                "nom : ${snapshot.data![index].nom} , prenom : ${snapshot.data![index].prenom} \nAge : ${snapshot.data![index].age}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      );
}
