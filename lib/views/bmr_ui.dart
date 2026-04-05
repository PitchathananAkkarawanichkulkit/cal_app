import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
//ตัวควบคุม TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController aCtrl = TextEditingController();

  String bmrValue = '0.00';

  String gender = 'ชาย';

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
                  'คำนวณหาอัตราการเผาผลาญที่ร่างกายต้องการ(BMR)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/image_2.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('เพศ', style: TextStyle(fontSize: 20))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            gender == 'ชาย' ? Colors.blue : Colors.grey,
                        fixedSize: Size(160, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          gender = 'ชาย';
                        });
                      },
                      child: Text(
                        'ชาย',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 2, 102, 184),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            gender == 'หญิง' ? Colors.pink : Colors.grey,
                        fixedSize: Size(160, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          gender = 'หญิง';
                        });
                      },
                      child: Text(
                        'หญิง',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
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
                Align(alignment: Alignment.centerLeft, child: Text('อายุ(ปี)')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: aCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "กรุณากรอกอายุ", border: OutlineInputBorder()),
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
                    // validate ui
                    if (wCtrl.text.isNotEmpty ||
                        hCtrl.text.isNotEmpty ||
                        aCtrl.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
                      );
                      return;
                    }

                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    int a = int.parse(aCtrl.text);
                    double bmr = 0;
                    if (gender == 'ชาย') {
                      bmr = 66 + (13.7 * w) + (5 * h) - (6.8 * a);
                    } else {
                      bmr = 655 + (9.6 * w) + (1.8 * h) - (4.7 * a);
                    }
                    setState(() {
                      bmrValue = bmr.toStringAsFixed(2);
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
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
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      aCtrl.clear();
                      bmrValue = '0.00';
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
                      Text('BMR'),
                      Text(bmrValue,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          )),
                      Text('Kcal/day'),
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
