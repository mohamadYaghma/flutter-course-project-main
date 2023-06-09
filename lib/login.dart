import 'package:flutter/material.dart';
import 'package:flutter_application_4/caregory_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_4/signIn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = '';
  String password = '';
  String userError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Color(0xfff2cb48),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('diamond shop'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              TextFormField(
                style: const TextStyle(color: Color(0xfff29f10)),
                onChanged: (value) {
                  setState(() {
                    user = value;
                    userError = '';
                  });
                  print(user);
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xffffffff)),
                  icon: const Icon(Icons.person),
                  iconColor: Color(0xfff29f10),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  labelText: 'نام کاربری',
                  hintText: 'نام کاربری خود را وارد کنید',
                  errorText: userError,
                  errorStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: TextStyle(color: Color(0xfff29f10)),
                onChanged: (value) {
                  setState(() {
                    password = value;
                    passwordError = '';
                  });
                  print(password);
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xffffffff)),
                  icon: const Icon(Icons.lock),
                  iconColor: Color(0xfff29f10),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  labelText: 'رمز عبور',
                  hintText: 'رمز عبور را وارد کنید',
                  errorText: passwordError,
                  errorStyle: TextStyle(color: Colors.white),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    margin: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (user.isEmpty || password.isEmpty) {
                          setState(() {
                            userError = '!!!لطفاً نام کاربری خود را وارد کنید';
                            passwordError = '!!!لطفاً پسورد خود را وارد کنید';
                          });
                        } else if (user == 'ali' && password == '123456') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => CategoryPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('ورود به حساب'),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text('ثبت نام'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
