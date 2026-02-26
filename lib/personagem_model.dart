class PersonagemModel {
  final String status;
  final int id;
  final String especies;
  final String image;
  final String type;
  final String gender;
  final String nome;


  PersonagemModel({required this.status, required this.id, required this.especies, required this.image, required this.type,
    required this.gender, required this.nome});

  factory PersonagemModel.fromJson(Map<String, dynamic> json) {
    return PersonagemModel(
        id: json['id'] ?? -1,
        nome: json['name'] ?? '',
        status: json['status'] ?? '',
        especies: json['species'] ?? '',
        image: json['image'] ?? '',
        type: json['type'] ?? '',
        gender: json['gender'] ?? '',
    );
  }


}
