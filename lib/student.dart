import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/loginpage.dart';

class StudentView extends StatefulWidget {
  const StudentView({Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  var email = '', name = '', userType = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    name = sp.getString('name') ?? '';
    userType = sp.getString('userType') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              email,
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            Text(
              name,
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            Text(
              userType,
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
