class Personne {
  String nom;
  String prenom;
  int age;
  Personne({required this.nom, required this.prenom, required this.age});
  factory Personne.fromJson(Map<String, dynamic> json) => Personne(
        nom: json["nom"],
        prenom: json["prenom"],
        age: json["age"],
      );
}
