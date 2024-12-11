import 'package:flutter/material.dart';
import 'package:projeto_ia/models/movimentacao.dart';
import 'package:projeto_ia/repository/movimentacao_repository.dart';

class MovimentacaoViewModel extends ChangeNotifier {
  final MovimentacaoRepository _movimentacaoRepository =
      MovimentacaoRepository();
  List<Movimentacao> movimentacoes = [];

  Future<void> fetchMovimentacoes() async {
    movimentacoes = await _movimentacaoRepository.getMovimentacoes();
    notifyListeners();
  }

  Future<void> addMovimentacao(Movimentacao movimentacao) async {
    await _movimentacaoRepository.insertMovimentacao(movimentacao);
    fetchMovimentacoes();
  }

  Future<void> updateMovimentacao(Movimentacao movimentacao) async {
    await _movimentacaoRepository.updateMovimentacao(movimentacao);
    fetchMovimentacoes();
  }

  Future<void> deleteMovimentacao(int id) async {
    await _movimentacaoRepository.deleteMovimentacao(id);
    fetchMovimentacoes();
  }
}
