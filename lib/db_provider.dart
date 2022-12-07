import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tugas7/database_helper.dart';
import 'package:tugas7/mahasiswa.dart';

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;
  List<Mahasiswa> _mahasiswas = [];
  List<Mahasiswa> get mahasiswas => _mahasiswas;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllMahasiswas();
  }

  void _getAllMahasiswas() async {
    _mahasiswas = await _dbHelper.getMahasiswas();
    notifyListeners();
  }

  Future<void> addMahasiswa(Mahasiswa mahasiswa) async {
    await _dbHelper.insertMahasiswa(mahasiswa);
    _getAllMahasiswas();
  }

  Future<void> delMahasiswa(Mahasiswa mahasiswa, int position) async {
    await _dbHelper.deleteMahasiswa(mahasiswa.id!);
    print(mahasiswa.npm);
    _getAllMahasiswas();
  }

  Future<void> upMahasiswa(Mahasiswa mahasiswa) async {
    await _dbHelper.updateMahasiswa(mahasiswa);
    _getAllMahasiswas();
  }

  // Future<void> upsertMahasiswa(Mahasiswa mahasiswa) async {
  //   if (mahasiswa.id != null) {
  //     upMahasiswa(mahasiswa);
  //   } else {
  //     addMahasiswa(mahasiswa);
  //   }
  // }
}
