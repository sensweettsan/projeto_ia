import 'package:flutter/material.dart';
import 'package:projeto_ia/models/turma.dart';
import 'package:projeto_ia/repository/turma_repository.dart';

class TurmaViewModel extends ChangeNotifier {
  final TurmaRepository _turmaRepository = TurmaRepository();
  List<Turma> turmas = [];

  Future<void> fetchTurmas() async {
    turmas = await _turmaRepository.getTurmas();
    notifyListeners();
  }

  Future<void> addTurma(Turma turma) async {
    await _turmaRepository.insertTurma(turma);
    fetchTurmas();
  }

  Future<void> updateTurma(Turma turma) async {
    await _turmaRepository.updateTurma(turma);
    fetchTurmas();
  }

  Future<void> deleteTurma(int id) async {
    await _turmaRepository.deleteTurma(id);
    fetchTurmas();
  }
}
