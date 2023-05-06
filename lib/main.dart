import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/scroll_provider.dart';
import 'package:wallpapers_app/provider/wallpapers_controller.dart';
import 'package:wallpapers_app/utils/routes.dart';


import 'package:wallpapers_app/views/wall_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(  create: (_) => WallpapersProvider(),),
           ChangeNotifierProvider(  create: (_) => ScrollProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
     
          primarySwatch: Colors.blue,
          
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,

          initialRoute:  Routes.wallScreenRoute,
  onGenerateRoute: Routes.generateRoute,
        home: const WallScreen(),
      ),
    );
  }
}

