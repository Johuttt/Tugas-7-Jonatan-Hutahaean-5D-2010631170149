import 'package:flutter/material.dart';
import 'package:tugas7/db_provider.dart';
import 'package:tugas7/mahasiswa.dart';
import 'package:provider/provider.dart';

class FormCreatePage extends StatefulWidget {
  final Mahasiswa? mahasiswa;

  const FormCreatePage({Key? key, this.mahasiswa}) : super(key: key);

  @override
  State<FormCreatePage> createState() => _FormCreatePageState();
}

class _FormCreatePageState extends State<FormCreatePage> {
  TextEditingController? nama;
  TextEditingController? npm;
  // bool _isUpdate = false;

  @override
  void initState() {
    nama = TextEditingController(
        text: widget.mahasiswa == null ? '' : widget.mahasiswa!.nama);
    npm = TextEditingController(
        text: widget.mahasiswa == null ? '' : widget.mahasiswa!.npm);
    super.initState();
    // if (widget.mahasiswa != null) {
    //   _titleController.text = widget.mahasiswa!.title;
    //   _descriptionController.text = widget.mahasiswa!.npm;
    //   // _isUpdate = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: nama,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: npm,
              decoration: const InputDecoration(
                labelText: 'NPM',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Simpan'),
                onPressed: () async {
                  final mahasiswa = Mahasiswa(
                    // id: widget.mahasiswa!.id!,
                    nama: nama!.text,
                    npm: npm!.text,
                  );
                  Provider.of<DbProvider>(context, listen: false)
                      .addMahasiswa(mahasiswa);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nama!.dispose();
    npm!.dispose();
    super.dispose();
  }
}
