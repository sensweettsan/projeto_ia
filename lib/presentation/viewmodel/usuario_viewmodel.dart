import 'package:flutter/material.dart';
import 'package:projeto_ia/models/usuario.dart';
import 'package:projeto_ia/repository/usuario_repository.dart';

class UsuarioViewModel extends ChangeNotifier {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();
  List<Usuario> usuarios = [];

  Future<void> fetchUsuarios() async {
    usuarios = await _usuarioRepository.getUsuarios();
    notifyListeners();
  }

  Future<void> addUsuario(Usuario usuario) async {
    await _usuarioRepository.insertUsuario(usuario);
    fetchUsuarios();
  }

  Future<void> updateUsuario(Usuario usuario) async {
    await _usuarioRepository.updateUsuario(usuario);
    fetchUsuarios();
  }

  Future<void> deleteUsuario(int id) async {
    await _usuarioRepository.deleteUsuario(id);
    fetchUsuarios();
  }
}
