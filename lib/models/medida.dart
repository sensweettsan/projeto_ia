class Medida {
  int? id;
  String medida;
  String descricao;

  Medida({
    this.id,
    required this.medida,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'idMedida': id,
      'Medida': medida,
      'Descricao': descricao,
    };
  }

  factory Medida.fromMap(Map<String, dynamic> map) {
    return Medida(
      id: map['idMedida'],
      medida: map['Medida'],
      descricao: map['Descricao'],
    );
  }
}
