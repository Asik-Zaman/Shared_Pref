import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/admin.dart';
import 'package:sp/homepage.dart';
import 'package:sp/loginpage.dart';
import 'package:sp/student.dart';
import 'package:sp/teacher.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogged = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if (islogged) {
      if (userType == 'student') {
        Timer(Duration(seconds: 5), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StudentView()));
        });
      } else if (userType == 'teacher') {
        Timer(Duration(seconds: 5), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeacherView()));
        });
      } else {
        Timer(Duration(seconds: 5), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminView()));
        });
      }
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            'https://images.pexels.com/photos/255501/pexels-photo-255501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
