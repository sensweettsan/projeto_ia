class Movimentacao {
  int? id;
  int idProdutos;
  int idTurma;
  int idUsuarios;
  String dataSaida;

  Movimentacao({
    this.id,
    required this.idProdutos,
    required this.idTurma,
    required this.idUsuarios,
    required this.dataSaida,
  });

  Map<String, dynamic> toMap() {
    return {
      'idMovimentacao': id,
      'idProdutos': idProdutos,
      'idTurma': idTurma,
      'idUsuarios': idUsuarios,
      'DataSaida': dataSaida,
    };
  }

  factory Movimentacao.fromMap(Map<String, dynamic> map) {
    return Movimentacao(
      id: map['idMovimentacao'],
      idProdutos: map['idProdutos'],
      idTurma: map['idTurma'],
      idUsuarios: map['idUsuarios'],
      dataSaida: map['DataSaida'],
    );
  }
}