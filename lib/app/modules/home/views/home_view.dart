import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/dosen/views/dosen_add_view.dart';
import 'package:myapp/app/modules/dosen/views/dosen_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_add_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_add_view.dart';
import 'package:myapp/app/modules/karyawan/views/karyawan_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Matakuliah_22312046',
      'view': MatakuliahView(),
      'add': () => MatakuliahAddView(),
    },
    // {
    //   'title': 'Data Mahasiswa',
    //   'view': MahasiswaView(),
    //   'add': () => MahasiswaAddView(),
    // },
    {
      'title': 'Data Dosen',
      'view': DosenView(),
      'add': () => DosenAddView(),
    },
    {
      'title': 'Data Karyawan',
      'view': KaryawanView(),
      'add': () => KaryawanAddView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        titleSpacing: 8,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(
            onPressed: () => Get.to(_fragment[_index]['add']),
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.teal,
        ),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            Text(
              "Siti Aspita Fitri",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Admin',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        onTap: () {
          setState(() => _index = 0);
          Get.back();
        },
        leading: Icon(Icons.dashboard),
        title: Text('Data Matakuliah'),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.teal,
        textColor: Colors.teal,
      ),
      ListTile(
        onTap: () {
          setState(() => _index = 1);
          Get.back();
        },
        leading: Icon(Icons.people),
        title: Text('Data Mahasiswa'),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.teal,
        textColor: Colors.teal,
      ),
      ListTile(
        onTap: () {
          setState(() => _index = 2);
          Get.back();
        },
        leading: Icon(Icons.people),
        title: Text('Data Dosen'),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.teal,
        textColor: Colors.teal,
      ),
      ListTile(
        onTap: () {
          setState(() => _index = 3);
          Get.back();
        },
        leading: Icon(Icons.people),
        title: Text('Karyawan_22312046'),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.teal,
        textColor: Colors.teal,
      ),
      ListTile(
        onTap: () {
          Get.back();
          cAuth.logout();
        },
        leading: Icon(Icons.logout),
        title: Text('Logout'),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.teal,
        textColor: Colors.teal,
      )
    ]));
  }
}