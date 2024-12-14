import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PegawaiUpdateView extends GetView {
  const PegawaiUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PegawaiUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PegawaiUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
