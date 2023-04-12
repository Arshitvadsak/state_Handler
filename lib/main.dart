import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/providers/counter_provider.dart';
import 'package:state_management_provider/controllers/providers/theme_peovider.dart';
import 'package:state_management_provider/views/screens/card_Page.dart';
import 'controllers/providers/product_provider.dart';
import 'views/screens/home_Page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PrductProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).TM.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomePage(),
            'CardPage': (context) => Card_Page(),
          },
        );
      },
    ),
  );
}
