import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatakuliahController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cKodeMatakuliah;
  late TextEditingController cNamaMatakuliah;
  late TextEditingController cSksMatakuliah;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference matakuliah = firestore.collection('matakuliah');

    return matakuliah.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference matakuliah = firestore.collection('matakuliah');
    return matakuliah.snapshots();
  }

  void add(String kode_matakuliah, String nama_matakuliah, String sks_matakuliah) async {
    CollectionReference matakuliah = firestore.collection("matakuliah");

    try {
      await matakuliah.add({
        "kode_matakuliah": kode_matakuliah,
        "nama_matakuliah": nama_matakuliah,
        "sks_matakuliah": sks_matakuliah,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data matakuliah",
          onConfirm: () {
            cKodeMatakuliah.clear();
            cNamaMatakuliah.clear();
            cSksMatakuliah.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Matakuliah.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("matakuliah").doc(id);

    return docRef.get();
  }

  void Update(String kode_matakuliah, String nama_matakuliah,
      String sks_matakuliah, String id) async {
    DocumentReference matakuliahById =
        firestore.collection("matakuliah").doc(id);

    try {
      await matakuliahById.update({
        "kode_matakuliah": kode_matakuliah,
        "nama_matakuliah": nama_matakuliah,
        "sks_matakuli": sks_matakuliah,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Matakuliah.",
        onConfirm: () {
          cKodeMatakuliah.clear();
          cNamaMatakuliah.clear();
          cSksMatakuliah.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Matakuliah.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("matakuliah").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cKodeMatakuliah = TextEditingController();
    cNamaMatakuliah = TextEditingController();
    cSksMatakuliah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cKodeMatakuliah.dispose();
    cNamaMatakuliah.dispose();
    cSksMatakuliah.dispose();
    super.onClose();
  }
}
