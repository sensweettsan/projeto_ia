import 'package:flutter/material.dart';
import 'admin_estoque.dart';
import 'admin_relatorio.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Bem-vindo ao painel do administrador!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminEstoque()),
                );
              },
              child: Text('Gerenciar Estoque'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminRelatorio()),
                );
              },
              child: Text('Relatórios de Movimentação'),
            ),
          ],
        ),
      ),
    );
  }
}
