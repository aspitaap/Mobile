import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PegawaiAddView extends GetView {
  const PegawaiAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PegawaiAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PegawaiAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
