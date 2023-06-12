import 'package:flutter/material.dart';
import 'package:flutter_application_4/drawer.dart';

class AdvancedSearchPage extends StatefulWidget {
  @override
  _AdvancedSearchPageState createState() => _AdvancedSearchPageState();
}

class _AdvancedSearchPageState extends State<AdvancedSearchPage> {
  String? _selectedCategory;
  double? _minPrice;
  double? _maxPrice;

  List<String> _categories = [
    'Electronics',
    'Jewelry',
    'Men\'s Clothing',
    'Women\'s Clothing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جستجوی پیشرفته'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value.toString();
                });
              },
              decoration: InputDecoration(
                labelText: 'انتخاب دسته بندی محصولات',
                border: OutlineInputBorder(),
              ),
              items: _categories
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _minPrice = double.tryParse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'حداقل قیمت',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _maxPrice = double.tryParse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'حداکثر قیمت',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle search functionality
                print('انتخاب دسته بندی: $_selectedCategory');
                print('حداقل قیمت: $_minPrice');
                print('حداکثر قیمت: $_maxPrice');
              },
              child: Text('جستجو'),
            ),
          ],
        ),
      ),
      endDrawer: Align(
        alignment: Alignment.centerRight,
        child: CustomDrawer(),
      ),
    );
  }
}
