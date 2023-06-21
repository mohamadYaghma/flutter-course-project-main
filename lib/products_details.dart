import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_4/drawer.dart';
import 'package:flutter_application_4/comentPage.dart';
import 'models/product.dart';

class ProductsPage extends StatefulWidget {
  String? categoryName;
  ProductsPage({Key? key, this.categoryName}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<dynamic>? _categoryProducts = [];
  Map<String, String> userInfo = {
    'name': 'John Doe',
    'email': 'johndoe@example.com',
  };

  int buyCounter = 0;
  int likeCounter = 0;

  @override
  void initState() {
    getCategoryProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _categoryProducts!.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.categoryName!),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.count(
                  crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  padding: EdgeInsets.all(8),
                  childAspectRatio: constraints.maxWidth > 600
                      ? (1.7 / 3) // نسبت ارتفاع به عرض برای تبلت‌ها
                      : (1.6 / 4), // نسبت ارتفاع به عرض برای موبایل‌ها
                  children: _categoryProducts!.map((product) {
                    Product parsedProduct = Product.fromJson(product);
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  parsedProduct.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    parsedProduct.title,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    parsedProduct.description.length > 50
                                        ? parsedProduct.description
                                                .substring(0, 50) +
                                            "..."
                                        : parsedProduct.description,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    parsedProduct.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Wrap(
                                      spacing: 5,
                                      children: <Widget>[
                                        ElevatedButton(
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              likeCounter++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            minimumSize: constraints.maxWidth >
                                                    600
                                                ? Size(48, 48)
                                                : Size(36,
                                                    36), // Updated size for larger screens and smaller screens
                                          ),
                                        ),
                                        ElevatedButton(
                                          child: Icon(
                                            Icons.comment,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductRatingPage(),
                                              ),
                                            );

                                            // انجام عملیات مربوط به نظرات
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            minimumSize: constraints.maxWidth >
                                                    600
                                                ? Size(48, 48)
                                                : Size(36,
                                                    36), // Updated size for larger screens and smaller screens
                                          ),
                                        ),
                                        ElevatedButton(
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              buyCounter++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            minimumSize: constraints.maxWidth >
                                                    600
                                                ? Size(48, 48)
                                                : Size(36,
                                                    36), // Updated size for larger screens and smaller screens
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "قیمت : " + parsedProduct.price + "تومان",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            endDrawer: Align(
              alignment: Alignment.centerRight,
              child: CustomDrawer(),
            ),
          );
  }

  Future<void> getCategoryProducts() async {
    final response = await http.get(Uri.parse(
        'https://fakestoreapi.com/products/category/${widget.categoryName}'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);

      setState(() {
        _categoryProducts = parsed;
      });
    }
  }
}
