import 'package:flutter/material.dart';
import 'package:flutter_application_4/caregory_page.dart';
import 'package:flutter_application_4/login.dart';
import 'package:flutter_application_4/newProduct.dart';
import 'package:flutter_application_4/search.dart';
import 'package:flutter_application_4/signIn.dart';
import 'package:flutter_application_4/userList.dart';
import 'package:flutter_application_4/abutme.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Ali',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'Ali@yahoo.com',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzLv9vYjAbhKg3ghUTD7yzta9fy4mPFhVYiw&usqp=CAU",
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text(
              'ساختن حساب کاربری جدید',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(
              'جستجوی پیشرفته محصولات',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdvancedSearchPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text(
              'محصولات',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text(
              'اضافه کردن محصول جدید',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewProductPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text(
              'اطلاعات کاربران',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'خروج از حساب کاربری',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'درباره ما',
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutApp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
