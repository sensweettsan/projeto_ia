import 'package:flutter/material.dart';
import 'instrutor_material_form.dart';

class InstrutorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - Instrutor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Bem-vindo ao painel do instrutor!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InstrutorMaterialForm()),
                );
              },
              child: Text('Solicitar Material Didático'),
            ),
          ],
        ),
      ),
    );
  }
}
