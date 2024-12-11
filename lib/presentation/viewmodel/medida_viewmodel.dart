import 'package:flutter/material.dart';
import 'package:projeto_ia/models/medida.dart';
import 'package:projeto_ia/repository/medida_repository.dart';

class MedidaViewModel extends ChangeNotifier {
  final MedidaRepository _medidaRepository = MedidaRepository();
  List<Medida> medidas = [];

  Future<void> fetchMedidas() async {
    medidas = await _medidaRepository.getMedidas();
    notifyListeners();
  }

  Future<void> addMedida(Medida medida) async {
    await _medidaRepository.insertMedida(medida);
    fetchMedidas();
  }

  Future<void> updateMedida(Medida medida) async {
    await _medidaRepository.updateMedida(medida);
    fetchMedidas();
  }

  Future<void> deleteMedida(int id) async {
    await _medidaRepository.deleteMedida(id);
    fetchMedidas();
  }
}
