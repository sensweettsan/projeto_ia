import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_ia/presentation/viewmodel/movimentacao_viewmodel.dart';

class AdminRelatorio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movimentacaoViewModel = Provider.of<MovimentacaoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Movimentação - Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Relatório de Movimentações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Removido o Expanded e adicionado shrinkWrap no ListView.builder
            ListView.builder(
              shrinkWrap:
                  true, // Permite que o ListView ocupe apenas o espaço necessário
              itemCount: movimentacaoViewModel.movimentacoes.length,
              itemBuilder: (context, index) {
                final movimentacao = movimentacaoViewModel.movimentacoes[index];
                return ListTile(
                  title: Text(
                      'Produto: ${movimentacao.produto.nome}'), //verificar erros
                  subtitle: Text('Data: ${movimentacao.dataSaida}'),
                  trailing: Text(
                      'Quantidade: ${movimentacao.quantidade}'), //verificar erros
                  onTap: () {
                    // Ação para ver detalhes do relatório
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
