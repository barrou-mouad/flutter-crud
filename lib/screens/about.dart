import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_test/models/api.dart';
import 'package:projet_test/models/personne.dart';
import 'package:projet_test/screens/home.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState();
  }
}

class AboutState extends State<About> {
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Seconde page"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: nomController,
                decoration: InputDecoration(
                    hintText: 'entrer votre nom',
                    prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: prenomController,
                decoration: InputDecoration(
                    hintText: 'entrer votre prenom',
                    prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: ageController,
                decoration: InputDecoration(
                    hintText: 'entrer votre age',
                    prefixIcon: Icon(Icons.person)),
              ),
              ElevatedButton(
                  onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            // int age=int.
                            ApiService().saveUsers(Personne(
                                nom: nomController.value.text,
                                prenom: nomController.value.text,
                                age: int.parse(ageController.value.text)))
                          }
                      },
                  child: Text("Confirmer")),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ))
                },
                child: Text("Show list"),
              ),
            ],
          ),
        ),
      );
}
