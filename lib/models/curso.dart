class Curso {
  int? id;
  String nome;
  String turma;

  Curso({
    this.id,
    required this.nome,
    required this.turma,
  });

  Map<String, dynamic> toMap() {
    return {
      'idCursos': id,
      'Nome': nome,
      'Turma': turma,
    };
  }

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      id: map['idCursos'],
      nome: map['Nome'],
      turma: map['Turma'],
    );
  }
}
