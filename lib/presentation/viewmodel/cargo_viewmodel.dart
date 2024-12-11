import 'package:flutter/material.dart';
import 'package:projeto_ia/models/cargo.dart';
import 'package:projeto_ia/repository/cargo_repository.dart';

class CargoViewModel extends ChangeNotifier {
  final CargoRepository _cargoRepository = CargoRepository();
  List<Cargo> cargos = [];

  Future<void> fetchCargos() async {
    cargos = await _cargoRepository.getCargos();
    notifyListeners();
  }

  Future<void> addCargo(Cargo cargo) async {
    await _cargoRepository.insertCargo(cargo);
    fetchCargos();
  }

  Future<void> updateCargo(Cargo cargo) async {
    await _cargoRepository.updateCargo(cargo);
    fetchCargos();
  }

  Future<void> deleteCargo(int id) async {
    await _cargoRepository.deleteCargo(id);
    fetchCargos();
  }
}
