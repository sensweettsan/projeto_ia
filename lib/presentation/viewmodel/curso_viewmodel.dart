import 'package:flutter/material.dart';
import 'package:projeto_ia/models/curso.dart';
import 'package:projeto_ia/repository/curso_repository.dart';

class CursoViewModel extends ChangeNotifier {
  final CursoRepository _cursoRepository = CursoRepository();
  List<Curso> cursos = [];

  Future<void> fetchCursos() async {
    cursos = await _cursoRepository.getCursos();
    notifyListeners();
  }

  Future<void> addCurso(Curso curso) async {
    await _cursoRepository.insertCurso(curso);
    fetchCursos();
  }

  Future<void> updateCurso(Curso curso) async {
    await _cursoRepository.updateCurso(curso);
    fetchCursos();
  }

  Future<void> deleteCurso(int id) async {
    await _cursoRepository.deleteCurso(id);
    fetchCursos();
  }
}
