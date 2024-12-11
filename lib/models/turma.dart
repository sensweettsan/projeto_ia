class Turma {
  int? id;
  String turma;
  String instrutor;
  int curso; // Refere-se à tabela Cursos

  Turma({
    this.id,
    required this.turma,
    required this.instrutor,
    required this.curso,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTurma': id,
      'Turma': turma,
      'Instrutor': instrutor,
      'Curso': curso,
    };
  }

  factory Turma.fromMap(Map<String, dynamic> map) {
    return Turma(
      id: map['idTurma'],
      turma: map['Turma'],
      instrutor: map['Instrutor'],
      curso: map['Curso'],
    );
  }
}
