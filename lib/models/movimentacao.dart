class Movimentacao {
  int? id;
  int idProdutos;
  int idTurma;
  int idUsuarios;
  String dataSaida;
  int quantidade; // Adicione a quantidade aqui

  Movimentacao({
    this.id,
    required this.idProdutos,
    required this.idTurma,
    required this.idUsuarios,
    required this.dataSaida,
    required this.quantidade, // E aqui no construtor
  });

  Map<String, dynamic> toMap() {
    return {
      'idMovimentacao': id,
      'idProdutos': idProdutos,
      'idTurma': idTurma,
      'idUsuarios': idUsuarios,
      'DataSaida': dataSaida,
      'quantidade': quantidade, // Adicione ao map
    };
  }

  factory Movimentacao.fromMap(Map<String, dynamic> map) {
    return Movimentacao(
      id: map['idMovimentacao'],
      idProdutos: map['idProdutos'],
      idTurma: map['idTurma'],
      idUsuarios: map['idUsuarios'],
      dataSaida: map['DataSaida'],
      quantidade: map['quantidade'], // E aqui ao fazer fromMap
    );
  }
}
