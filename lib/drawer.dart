import 'package:flutter/material.dart';
import 'package:flutter_application_4/abutme.dart';
import 'package:flutter_application_4/caregory_page.dart';
import 'package:flutter_application_4/login.dart';
import 'package:flutter_application_4/signIn.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Ali',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            accountEmail: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, bottom: 16.0),
                child: Text(
                  'Ali@yahoo.com',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            currentAccountPicture: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 72.0,
                height: 72.0,
                child: ClipOval(
                  child: CircleAvatar(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzLv9vYjAbhKg3ghUTD7yzta9fy4mPFhVYiw&usqp=CAU",
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
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
            leading: const Icon(Icons.add_circle),
            title: Text(
              ' ساختن حساب کاربری جدید ',
              textAlign: TextAlign.right, // تنظیم راست چین بودن عنوان منو
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
            leading: const Icon(Icons.shopping_basket),
            title: Text(
              'محصولات',
              textAlign: TextAlign.right, // تنظیم راست چین بودن عنوان منو
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
            leading: const Icon(Icons.outbond),
            title: Text(
              'خروج از حساب کاربری',
              textAlign: TextAlign.right, // تنظیم راست چین بودن عنوان منو
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
            leading: const Icon(Icons.person),
            title: Text(
              'درباره ما',
              textAlign: TextAlign.right, // تنظیم راست چین بودن عنوان منو
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
          // Add more ListTile widgets for additional menu items
        ],
      ),
    );
  }
}
