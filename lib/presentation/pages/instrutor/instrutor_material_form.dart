import 'package:flutter/material.dart';

class InstrutorMaterialForm extends StatefulWidget {
  @override
  _InstrutorMaterialFormState createState() => _InstrutorMaterialFormState();
}

class _InstrutorMaterialFormState extends State<InstrutorMaterialForm> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final justificativaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitação de Material - Instrutor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome do Material'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do material';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: justificativaController,
                decoration: InputDecoration(labelText: 'Justificativa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a justificativa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Enviar solicitação
                  }
                },
                child: Text('Enviar Solicitação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
