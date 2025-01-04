import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class KaryawanController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cNo_Karyawan;
  late TextEditingController cNama_Karyawan;
  late TextEditingController cJabatan_Karyawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan_22312046 =
        firestore.collection('karyawan_22312046');

    return karyawan_22312046.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawan_22312035 =
        firestore.collection('karyawan_22312046');
    return karyawan_22312035.snapshots();
  }

  void add(
      String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference karyawan_22312035 =
        firestore.collection("karyawan_22312046");

    try {
      await karyawan_22312035.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data Karyawan",
          onConfirm: () {
            cNo_Karyawan.clear();
            cNama_Karyawan.clear();
            cJabatan_Karyawan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String no_karyawan) async {
    DocumentReference docRef =
        firestore.collection("karyawan_22312046").doc(no_karyawan);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan, String id) async {
    DocumentReference karyawan_22312046ById =
        firestore.collection("karyawan_22312046").doc(id);

    try {
      await karyawan_22312046ById.update({
        "jabatan_karyawan": jabatan_karyawan,
        "nama_karyawan": nama_karyawan,
        "no_karyawan": no_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Karyawan.",
        onConfirm: () {
          cNo_Karyawan.clear();
          cNama_Karyawan.clear();
          cJabatan_Karyawan.clear();
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
        middleText: "Gagal Mengubah data Karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan_22312046").doc(id);

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
    cNo_Karyawan = TextEditingController();
    cNama_Karyawan = TextEditingController();
    cJabatan_Karyawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo_Karyawan.dispose();
    cNama_Karyawan.dispose();
    cJabatan_Karyawan.dispose();
    super.onClose();
  }
}
