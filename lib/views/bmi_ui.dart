import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  // ตัวควบคุมสำหรับ TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  //สร้างตัวแปรสำหรับเก็บค่า BMI และผลลัพธ์การแปลผล
  String bmiShowValue = '0.00';
  String bmiShowResult = 'การแปลผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/image_3.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('น้ำหนัก (kg.)')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "กรุณากรอกน้ำหนัก",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('ส่วนสูง (cm.)')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "กรุณากรอกส่วนสูง",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  onPressed: () {
                    //validate ui (ตรวจสอบความถูกต้องของข้อมูลใน TextField)
                    if (wCtrl.text.isEmpty || hCtrl.text.isEmpty) {
                      // แสดงข้อความเตือนผู้ใช้ให้กรอกข้อมูลให้ครบถ้วน
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกน้ำหนักให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration:
                              Duration(seconds: 2), // แสดงเวลาของข้อความเตือน
                        ),
                      );
                      return; // หยุดการทำงานของฟังก์ชันถ้าข้อมูลไม่ครบถ้วน
                    }
                    //คำนวณ BMI
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);

                    double bmi =
                        w / ((h / 100) * (h / 100)); //น้ำหนัก / (ส่วนสูง/100)^2

                    setState(() {
                      bmiShowValue = bmi.toStringAsFixed(
                          2); //แสดงผลลัพธ์ BMI โดยปัดเศษทศนิยม 2 ตำแหน่ง
                    });

                    //แปลผล และแสดงผลลการแปลผล
                    setState(() {
                      bmiShowResult = 'การแปลผล';
                      if (bmi < 18.5) {
                        bmiShowResult = 'น้ำหนักน้อย / ผอม';
                      } else if (bmi >= 18.5 && bmi < 25) {
                        bmiShowResult = 'น้ำหนักปกติ / สมส่วน';
                      } else if (bmi >= 25 && bmi < 30) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 1';
                      } else if (bmi >= 30 && bmi < 35) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 2';
                      } else if (bmi >= 35) {
                        bmiShowResult = 'น้ำหนักมาก / โรคอ้วนระดับ 3';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  onPressed: () {
                    //ล้างข้อมูลใน TextField และผลลัพธ์การแสดงผล
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      bmiShowValue = '0.00';
                      bmiShowResult = 'การแปลผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text('BMI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(bmiShowValue,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          )),
                      Text(bmiShowResult,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
