import 'package:flutter/material.dart';

class ProductRatingPage extends StatefulWidget {
  @override
  _ProductRatingPageState createState() => _ProductRatingPageState();
}

class _ProductRatingPageState extends State<ProductRatingPage> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 0;
  String _comment = '';
  bool _isLoading = false;

  String? _validateComment(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفاً نظر خود را وارد کنید.';
    }
    return null;
  }

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _setComment(String comment) {
    setState(() {
      _comment = comment;
    });
  }

  void _submitRating() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // شبیه‌سازی عملیات ثبت نظر
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('با تشکر'),
            content: Text('!!! نظر شما با موفقیت ثبت شد'),
            actions: [
              TextButton(
                child: Text('باشه'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه نظر دهی'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'امتیاز شما به این محصول : $_rating',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _rating >= 1 ? Colors.yellow : Colors.grey,
                    onPressed: () => _setRating(1),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _rating >= 2 ? Colors.yellow : Colors.grey,
                    onPressed: () => _setRating(2),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _rating >= 3 ? Colors.yellow : Colors.grey,
                    onPressed: () => _setRating(3),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _rating >= 4 ? Colors.yellow : Colors.grey,
                    onPressed: () => _setRating(4),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _rating >= 5 ? Colors.yellow : Colors.grey,
                    onPressed: () => _setRating(5),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) => _setComment(value),
                decoration: InputDecoration(
                  hintText: 'نظر خود را وارد کنید',
                  border: OutlineInputBorder(),
                ),
                validator: _validateComment,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child:
                    _isLoading ? CircularProgressIndicator() : Text('ثبت نظر'),
                onPressed: _isLoading ? null : _submitRating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'صفحه نظر دهی',
    home: ProductRatingPage(),
  ));
}
