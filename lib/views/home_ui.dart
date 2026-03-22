import 'package:cal_app/views/about_ui.dart';
import 'package:cal_app/views/bmi_ui.dart';
import 'package:cal_app/views/bmr_ui.dart';
import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int selectedIndex = 1;

  //สร้างตัวแปรเก็บหน้าจอย่อยที่จะเอามาใช้กับ body
  List subPage = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ App bar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'BHC App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // ส่วนของ bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        //อยากให้ item ไหนถูกเลือกให้เอาเลข item นั้่นมาใส่
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'เกี่ยวกับ'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_run_outlined,
              ),
              label: 'BMR'),
        ],
      ),
      body: subPage[selectedIndex],
    );
  }
}
