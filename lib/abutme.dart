import 'package:flutter/material.dart';
import 'package:flutter_application_4/caregory_page.dart';

void main() {
  runApp(AboutApp());
}

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  void comeBack() {
    // انجام عملیات ثبت نام
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(),
      ),
    );
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuart,
    ));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'front end محمد یغما هستم علاقه مند به برنامه نویسی',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'اقدام فرمایید mohamadyaghma98@gmail.com :همچنین شما میتوانید برای ارتباط با من از طریق ایمیل به نشانی',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        ':) به اقای استیوجابز می‌باشد html از جمله افتخارات این جانب کار در شرکت مایکروسافت و اموزش ابتدایی',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ScaleTransition(
                    scale: _fadeAnimation,
                    child: IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () {
                        // انجام عملیات مربوط به ارسال ایمیل
                      },
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: comeBack,
                    child: Text('بازگشت'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
