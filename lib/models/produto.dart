class Produto {
  int? id;
  String nome;
  int medida; // Refere-se à tabela Medida
  String local;
  int entrada;
  int saida;
  int saldo;
  String codigo;
  String dataEntrada;

  Produto({
    this.id,
    required this.nome,
    required this.medida,
    required this.local,
    required this.entrada,
    required this.saida,
    required this.saldo,
    required this.codigo,
    required this.dataEntrada,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProdutos': id,
      'Nome': nome,
      'Medida': medida,
      'Local': local,
      'Entrada': entrada,
      'Saida': saida,
      'Saldo': saldo,
      'Codigo': codigo,
      'DataEntrada': dataEntrada,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['idProdutos'],
      nome: map['Nome'],
      medida: map['Medida'],
      local: map['Local'],
      entrada: map['Entrada'],
      saida: map['Saida'],
      saldo: map['Saldo'],
      codigo: map['Codigo'],
      dataEntrada: map['DataEntrada'],
    );
  }
}
