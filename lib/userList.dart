import 'package:flutter/material.dart';
import 'package:flutter_application_4/drawer.dart';

class User {
  String fullName;
  int age;
  int phone;
  String date;
  String gender;
  String image;

  User(this.fullName, this.age, this.date, this.phone, this.gender, this.image);
}

class UserRepository {
  List<User> users = [
    User('mohamad yaghma', 25, '1998-12-10', 0915115115, 'Male',
        'assets/images/man.jfif'),
    User('jafar jafari', 30, '2015-9-20', 0917117117, 'Male',
        'assets/images/user2.png'),
    User('ali aliabadi', 28, '2001-12-11', 091611116, 'Male',
        'assets/images/user3.png'),
    User('abbas aliabadi', 40, '2006-12-06', 0917811187, 'Male',
        'assets/images/user4.png'),
    User('ali namjo', 27, '2023-10-10', 091241125, 'Male',
        'assets/images/user5.png'),
    User('hani bayat', 25, '1998-12-10', 091611116, 'Female',
        'assets/images/user6.png'),
    User('maryam maryami', 24, '2001-12-11', 091611116, 'Female',
        'assets/images/user7.png'),
    User('atena atenazadeh', 27, '2015-9-20', 091611116, 'Female',
        'assets/images/user8.png'),
    User('ariyan ariyanzadeh', 29, '2001-12-11', 091611116, 'Male',
        'assets/images/user9.png'),
    User('azale azalezadeh', 32, '2023-10-10', 091611116, 'Female',
        'assets/images/user10.png'),
    User('berelian mosavi', 20, '1998-12-10', 0914311134, 'Female',
        'assets/images/user11.png'),
  ];
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      endDrawer: Align(
        alignment: Alignment.centerRight,
        child: CustomDrawer(),
      ),
      body: ListView.builder(
        itemCount: userRepository.users.length,
        itemBuilder: (context, index) {
          User user = userRepository.users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(user.image),
              ),
              title: Text(
                user.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${user.age}'),
                  Text('Date: ${user.date}'),
                  Text('PhoneNumber: ${user.phone}'),
                  Text('Gender: ${user.gender}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
