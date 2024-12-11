class Cargo {
  int? id;
  String cargo;
  String matricula;

  Cargo({
    this.id,
    required this.cargo,
    required this.matricula,
  });

  // Converte um Cargo para um Map, para facilitar a inserção no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'idCargos': id,
      'Cargo': cargo,
      'Matricula': matricula,
    };
  }

  // Constrói um Cargo a partir de um Map
  factory Cargo.fromMap(Map<String, dynamic> map) {
    return Cargo(
      id: map['idCargos'],
      cargo: map['Cargo'],
      matricula: map['Matricula'],
    );
  }
}
