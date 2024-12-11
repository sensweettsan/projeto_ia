import 'package:projeto_ia/models/usuario.dart';
import 'package:projeto_ia/repository/usuario_repository.dart';

class AuthService {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  // Autenticação do usuário com nome e senha
  Future<Usuario?> login(String nome, String senha) async {
    List<Usuario> usuarios = await _usuarioRepository.getUsuarios();

    for (var usuario in usuarios) {
      if (usuario.nome == nome && usuario.senha == senha) {
        return usuario; // Login bem-sucedido
      }
    }

    return null; // Login falhou
  }

  // Verificar se o usuário é administrador
  bool isAdmin(Usuario usuario) {
    return usuario.cargo == 1; // Supondo que cargo 1 seja para Administrador
  }

  // Verificar se o usuário é instrutor
  bool isInstrutor(Usuario usuario) {
    return usuario.cargo == 2; // Supondo que cargo 2 seja para Instrutor
  }
}
