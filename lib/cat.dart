import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/products_details.dart';
import 'package:http/http.dart' as http;

class CategoryPage2 extends StatefulWidget {
  const CategoryPage2({Key? key}) : super(key: key);

  @override
  State<CategoryPage2> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage2> {
  List<dynamic>? _categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return _categories!.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(96, 165, 250, 1),
                      Color(0xFF0A84FF),
                    ],
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 2,
                  children: _categories!.map((category) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsPage(
                              categoryName: category,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(3, 6),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }

  Future<void> getCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'))
        .timeout(const Duration(minutes: 1), onTimeout: () {
      return http.Response('Http error', 400);
    });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);

      setState(() {
        _categories = parsed;
      });
    } else {
      print('خطا در دریافت دسته‌بندی‌ها');
    }
  }
}
