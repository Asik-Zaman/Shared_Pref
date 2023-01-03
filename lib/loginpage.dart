import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/admin.dart';
import 'package:sp/homepage.dart';
import 'package:sp/student.dart';
import 'package:sp/teacher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();

  String dropdownvalue = 'student';

  var items = [
    'student',
    'teacher',
    'admin',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 170.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'UserType',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color:
                        Colors.lightGreen, //background color of dropdown button
                    border: Border.all(
                        color: Colors.black38,
                        width: 3), //border of dropdown button
                    borderRadius: BorderRadius.circular(
                        50), //border raiuds of dropdown button
                    boxShadow: <BoxShadow>[
                      //apply shadow on Dropdown button
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: DropdownButton(
                    value: dropdownvalue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    icon: Padding(
                        //Icon at tail, arrow bottom is default icon
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.arrow_circle_down_sharp)),
                    iconEnabledColor: Colors.white, //Icon color
                    style: TextStyle(
                        //te
                        color: Colors.white, //Font color
                        fontSize: 20 //font size on dropdown button
                        ),

                    dropdownColor: Colors.blue, //dropdown background color
                    underline: Container(), //remove underline
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('name', nameController.text.toString());
                  sp.setString('userType', dropdownvalue.toString());
                  sp.setBool('isLogin', true);
                  if (sp.getString('userType') == 'student') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentView()));
                  } else if (sp.getString('userType') == 'teacher')
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TeacherView()));
                  else if (sp.getString('userType') == 'admin')
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminView()));
                  else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
