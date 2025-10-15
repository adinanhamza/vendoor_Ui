import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendoor_app/controller/bottomnavcontroller.dart';
import 'package:vendoor_app/controller/providers.dart';
import 'package:vendoor_app/view/homescreen.dart';


void main() {
  runApp(const VendrooApp());
}

class VendrooApp extends StatelessWidget {
  const VendrooApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create:  (_) => TabProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const VendrooHomeScreen(),
      ),
    );
  }
}
