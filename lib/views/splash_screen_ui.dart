import 'package:cal_app/views/home_ui.dart';
import 'package:flutter/material.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {

  @override
  void initState() {
    // หน่วงเวลาหน้าจอ 3 วิ และวเด้งไปหน้า home แบบย้อนกลับไม่ได้
    super.initState();
    Future.delayed(
      // เวลาที่จะหน่วง
      Duration(seconds: 3),
      //จะให้ทำอะไรต่อ
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 76, 54),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Body health Calculator',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              '© 2026 All rights reserved.',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'Create by Ben',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
