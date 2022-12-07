class Mahasiswa {
  late int? id;
  late String nama;
  late String npm;

  Mahasiswa({this.id, required this.nama, required this.npm});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'npm': npm,
    };
  }

  Mahasiswa.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    npm = map['npm'];
  }
}
