import 'dart:convert';
import 'package:flutter_application_4/cat.dart';
import 'package:flutter_application_4/login.dart';
import 'package:flutter_application_4/products_details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_4/abutme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/drawer.dart';

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
            title: Row(
              children: [
                const Text('...خوش آمدید'),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    iconSize: 16,
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                      // Perform logout action here
                      // For example, you can navigate to the login screen and clear user session data
                    },
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'دسته بندی محصولات',
                ),
                Tab(
                  icon: Icon(Icons.people),
                  text: 'درباره ما',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoryPage2(),
              AboutApp(),
            ],
          ),
          endDrawer: Align(
            alignment: Alignment.centerRight,
            child: CustomDrawer(),
          ),
        ),
      ),
    );
  }

  Future<void> getCategories() async {
    final response = await http
        .get(
          Uri.parse('https://fakestoreapi.com/products/categories'),
        )
        .timeout(
          const Duration(minutes: 1),
          onTimeout: () => http.Response('Http error', 400),
        );

    if (response.statusCode == 200) {
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
