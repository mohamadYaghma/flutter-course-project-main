import 'package:flutter/material.dart';
import 'package:flutter_application_4/caregory_page.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        //color: Color(0xff958f92),
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50))),

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
                onChanged: ((value) {
                  user = value;
                  print(user);
                }),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Color(0xffffffff)),
                  icon: const Icon(Icons.person),
                  iconColor: Color(0xfff29f10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff29f10)),
                  ),
                  labelText: 'نام کاربری',
                  hintText: 'نام کاربری خود را وارد کنید',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: TextStyle(color: Color(0xfff29f10)),
                onChanged: ((value) {
                  password = value;
                  print(password);
                }),
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffffffff)),
                    icon: const Icon(Icons.lock),
                    iconColor: Color(0xfff29f10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfff29f10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfff29f10)),
                    ),
                    labelText: 'رمز عبور',
                    hintText: 'رمز عبور را وارد کنید'),
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (user == 'ali' && password == '123456') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CategoryPage()));
                    }
                  },
                  child: const Text('ورود به حساب'),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ]),
      )),
    );
  }
}

// class _LoginScreenState extends State<LoginScreen> {
//   String user = '', password = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         //color: Color(0xff958f92),
//         padding: const EdgeInsets.all(30),
//         decoration: const BoxDecoration(
//             // color: Color(0xff0d967f),
//             // color: Color(0xfffff8f8),
//             // border: Border.all(
//             //   color: Color(0xff000000),
//             // ),
//             borderRadius: const BorderRadius.all(Radius.circular(50))),

//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 160,
//               ),
//               TextFormField(

//                 onChanged: ((value) {
//                   user = value;
//                   print(user);
//                 }),
//                 decoration: const InputDecoration(
//                   icon: const Icon(Icons.person),
//                   border: OutlineInputBorder(),
//                   labelText: 'نام کاربری',
//                   hintText: 'نام کاربری خود را وارد کنید',
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 onChanged: ((value) {
//                   password = value;
//                   print(password);
//                 }),
//                 decoration: const InputDecoration(
//                     icon: const Icon(Icons.lock),
//                     border: OutlineInputBorder(),
//                     labelText: 'رمز عبور',
//                     hintText: 'رمز عبور را وارد کنید'),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: 150,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (user == 'ali' && password == '123456') {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   CategoryPage()));
//                     }
//                   },
//                   child: const Text('ورود به حساب'),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               )
//             ]),
//       )),
//     );
//   }
// }
