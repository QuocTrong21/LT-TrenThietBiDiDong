// Bước 1: Thêm dependency vào pubspec.yaml
// dependencies:
//   provider: ^6.1.1
//   flutter:
//     sdk: flutter

// Bước 2: Chạy lệnh trong terminal
// flutter pub add provider
// hoặc
// flutter pub get


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
//import 'bai_1/ex1.dart';
//import 'bai_2/ex2.dart';
//import 'bai_3/ex3.dart';
//import 'bai_4/ex4.dart';
import 'bai_5/ex5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Thay MaterialApp bằng GetMaterialApp
      title: 'Counter App with GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}
