import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_ia/presentation/viewmodel/produto_viewmodel.dart';

class AdminEstoque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtoViewModel = Provider.of<ProdutoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque - Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Gerenciamento de Estoque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: produtoViewModel.produtos.length,
                itemBuilder: (context, index) {
                  final produto = produtoViewModel.produtos[index];
                  return ListTile(
                    title: Text(produto.nome),
                    subtitle: Text('Quantidade: ${produto.saldo}'),
                    onTap: () {
                      // Ação de edição ou visualização dos detalhes
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
