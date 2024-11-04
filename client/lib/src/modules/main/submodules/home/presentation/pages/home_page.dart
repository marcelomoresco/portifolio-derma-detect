import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
