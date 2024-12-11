class Usuario {
  int? id;
  String nome;
  String senha;
  String telefone;
  String email;
  String endereco;
  int cargo; // Refere-se à tabela Cargos

  Usuario({
    this.id,
    required this.nome,
    required this.senha,
    required this.telefone,
    required this.email,
    required this.endereco,
    required this.cargo,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuarios': id,
      'Nome': nome,
      'Senha': senha,
      'Telefone': telefone,
      'Email': email,
      'Endereco': endereco,
      'Cargo': cargo,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['idUsuarios'],
      nome: map['Nome'],
      senha: map['Senha'],
      telefone: map['Telefone'],
      email: map['Email'],
      endereco: map['Endereco'],
      cargo: map['Cargo'],
    );
  }
}
