import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/drawer.dart';
import 'package:image_picker/image_picker.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافه کردن محصول جدید'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image picker
              InkWell(
                onTap: getImage,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'نام محصول',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'این فیلد اجباری است !!!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'قیمت',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'این فیلد اجباری است !!!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'درباره محصول',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'این فیلد اجباری است !!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit the form data
                    final String name = _nameController.text;
                    final String price = _priceController.text;
                    final String description = _descriptionController.text;

                    // TODO: Handle form submission and image upload

                    // Reset the form
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text('ارسال'),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Align(
        alignment: Alignment.centerRight,
        child: CustomDrawer(),
      ),
    );
  }
}
