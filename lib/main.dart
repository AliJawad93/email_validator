import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  bool isEmailCorrect = false;
  Color trueColor = Color.fromARGB(255, 72, 204, 77);
  Color error = Colors.red;
  String code =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1f1f),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Validator"),
        backgroundColor: isEmailCorrect ? trueColor : error,
        elevation: 0,
      ),
      body: Form(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Enter your Email :",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                isEmailCorrect ? "👍 ✅" : "👎 ❌",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (email) {
                  setState(() {
                    isEmailCorrect = RegExp(code).hasMatch(email);
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    suffixIcon: isEmailCorrect
                        ? Icon(Icons.done, color: trueColor)
                        : Icon(
                            Icons.close,
                            color: error,
                          ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: isEmailCorrect ? trueColor : error,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: isEmailCorrect ? trueColor : error,
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Log in"),
                style: ElevatedButton.styleFrom(
                  primary: isEmailCorrect ? trueColor : error,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
