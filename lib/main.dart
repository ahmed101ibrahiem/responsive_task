import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_task/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>
       MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade300,
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.blue
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 30),
            iconTheme: IconThemeData(color: Colors.white)
          )
        ),
        home:  HomeScreen(),
      ),
    );
  }
}
