import 'package:flutter/material.dart';
import 'admin/admin_dashboard.dart';
import 'instrutor/instrutor_dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulação de um cargo de usuário logado
    final String cargo = 'Administrador'; // ou 'Instrutor'

    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (cargo == 'Administrador') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AdminDashboard()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InstrutorDashboard()),
              );
            }
          },
          child: Text('Entrar como $cargo'),
        ),
      ),
    );
  }
}
