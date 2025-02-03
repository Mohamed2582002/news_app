
import 'package:flutter/material.dart';
import 'package:news/Ui/home/drawer/app_theme_provider.dart';
import 'package:news/Ui/home/home_screen.dart';
import 'package:news/Utils/app_theme.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(ChangeNotifierProvider(
      create: (context)=> AppThemeProvider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) ;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName :(context) => HomeScreen() ,
        //NewsWebView.routeName:(context)=> NewsWebView(url: ''),

      },
      theme: AppTheme.lightTheme,
      darkTheme:  AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}

