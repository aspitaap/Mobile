import 'package:myapp/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MatakuliahUpdateView extends GetView<MatakuliahController> {
  const MatakuliahUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Matakuliah'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cKodeMatakuliah.text = data['kode_matakuliah'];
            controller.cNamaMatakuliah.text = data['nama_matakuliah'];
            controller.cNamaMatakuliah.text = data['sks_matakuliah'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cKodeMatakuliah,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "kode_matakuliah"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNamaMatakuliah,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "nama_matakuliah"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                    TextField(
                    controller: controller.cSksMatakuliah,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "sks_matakuliah"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cKodeMatakuliah.text,
                      controller.cNamaMatakuliah.text,
                      controller.cSksMatakuliah.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}