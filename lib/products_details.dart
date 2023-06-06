import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/product.dart';

class ProductsPage extends StatefulWidget {
  String? categoryName;
  ProductsPage({Key? key, this.categoryName}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<dynamic>? _categoryProducts = [];

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
            body: Container(
                child: ListView.builder(
                    itemCount: _categoryProducts!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product =
                          Product.fromJson(_categoryProducts![index]);
                      return Container(
                        width: 300,
                        height: 200,
                        padding: new EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.red,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(
                                  product.image,
                                  width: 200,
                                  height: 200,
                                ),
                                title: Text(product.title,
                                    style: TextStyle(fontSize: 30.0)),
                                subtitle: Text('Best of Sonu Nigam Music.',
                                    style: TextStyle(fontSize: 18.0)),
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  ElevatedButton(
                                    child: const Text('buy'),
                                    onPressed: () {/* ... */},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })));
  }

//             Container(
//               color: Color(0xFFBBDEFB),
//               child: ListView.builder(
//                 itemCount: _categoryProducts!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Product product = Product.fromJson(_categoryProducts![index]);
//                   return Container(
//                       color: Colors.amber[100],
//                       padding: const EdgeInsets.all(20),
//                       margin: const EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Title: ' + product.title),
//                           Text('Price: ' + product.price),
//                           Text('Description: ' + product.description),
//                           Text('Category: ' + product.category),
//                           Image.network(
//                             product.image,
//                             width: 200,
//                             height: 200,
//                           ),
//                           Text(
//                               'rating: ${product.rating['rate']}  --- Count ${product.rating['count']}'),
//                         ],
//                       ));
//                 },
//               ),
//             ));
//   }

  Future<void> getCategoryProducts() async {
    final response = await http.get(Uri.parse(
        'https://fakestoreapi.com/products/category/${widget.categoryName}'));

    if (response.statusCode == 200) {
      //  final responseBody = utf8.decode(response.bodyBytes);
      final parsed = json.decode(response.body);
      print(parsed);

      setState(() {
        _categoryProducts = parsed;
      });
    }
  }
}
