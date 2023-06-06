import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_4/cat.dart';
import 'package:flutter_application_4/products_details.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<dynamic>? _categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('دسته ها'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.contacts), text: 'wwww'),
                    Tab(icon: Icon(Icons.contacts), text: 'eeee'),
                    Tab(icon: Icon(Icons.contacts), text: 'ffff'),
                    Tab(icon: Icon(Icons.contacts), text: 'hhghg'),

                    // Tab(icon: Icon(Icons.camera_alt), text: "Tab 2"),
                    // Tab(icon: Icon(Icons.camera_alt), text: "Tab 3"),
                    // Tab(icon: Icon(Icons.camera_alt), text: "Tab 4"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  CategoryPage2(),
                  Text('sddd'),
                  Text('sdfasdfggfh'),
                  Text('sdfgasdffh'),
                ],
              ),
            )));
  }

  Future<void> getCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'))
        .timeout(const Duration(minutes: 1), onTimeout: () {
      return http.Response('Http error', 400);
    });

    if (response.statusCode == 200) {
      //  final responseBody = utf8.decode(response.bodyBytes);
      final parsed = json.decode(response.body);
      print(parsed);

      setState(() {
        _categories = parsed;
      });
    } else {
      print('sdf df sdfs dgsaklswdnfsvndl');
    }
  }
}

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return

//   }
// }

// class SecondScreen extends StatelessWidget {
//   List<dynamic>? _categories = [];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Container(
//       color: Color(0xffdca640),
//       child: ListView.builder(
//         itemCount: _categories!.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding: const EdgeInsets.all(10),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductsPage(
//                       categoryName: _categories![index],
//                     ),
//                   ),
//                 );
//               },
//               child: Text(_categories![index][1]),
//             ),
//           );
//         },
//       ),
//     ));
//   }
// }

// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//           child: Text(
//         'It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
//         style: TextStyle(fontSize: 32.0),
//       )),
//     );
//   }
// }

// class FourthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child: Text(
//           'It is a second layout tab, which is responsible for taking pictures from your mobile.',
//           style: TextStyle(fontSize: 35.0),
//         ),
//       ),
//     );
//   }
// }
