import 'package:flutter/material.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';
import 'package:get/get.dart';

class KaryawanAddView extends GetView<KaryawanController> {
  const KaryawanAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNo_Karyawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "No_Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama_Karyawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama Karyawan"),
            ),
            TextField(
              controller: controller.cJabatan_Karyawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Jabatan_Karyawan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNo_Karyawan.text,
                controller.cNama_Karyawan.text,
                controller.cJabatan_Karyawan.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}