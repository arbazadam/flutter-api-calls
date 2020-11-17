import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  static final routeName='/prod_overview';
  
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
          body: Container(
        child: Text(args)
      ),
    );
  }
}