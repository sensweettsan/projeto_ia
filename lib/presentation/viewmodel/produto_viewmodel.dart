import 'package:flutter/material.dart';
import 'package:projeto_ia/models/produto.dart';
import 'package:projeto_ia/repository/produto_repository.dart';

class ProdutoViewModel extends ChangeNotifier {
  final ProdutoRepository _produtoRepository = ProdutoRepository();
  List<Produto> produtos = [];

  Future<void> fetchProdutos() async {
    produtos = await _produtoRepository.getProdutos();
    notifyListeners();
  }

  Future<void> addProduto(Produto produto) async {
    await _produtoRepository.insertProduto(produto);
    fetchProdutos();
  }

  Future<void> updateProduto(Produto produto) async {
    await _produtoRepository.updateProduto(produto);
    fetchProdutos();
  }

  Future<void> deleteProduto(int id) async {
    await _produtoRepository.deleteProduto(id);
    fetchProdutos();
  }
}
