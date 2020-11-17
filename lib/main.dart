import 'package:first_app/http-requests/HttpWorkloads.dart';
import 'package:first_app/screens/product_overview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/Products.dart';
import 'models/Todos.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewWidget(),
      routes: {
        ProductOverviewScreen.routeName: (context) => ProductOverviewScreen()
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  Future<List<Products>> flist;
  NewWidget() {
    flist = HttpWorkloads.getAllProducts();
  }
  Future<Todos> todos;
  final listOfNames = ['Arbaz', 'Adam', 'Adil'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: flist,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder(
                    future: flist,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            itemCount: snapshot.data.length,
                            separatorBuilder: (context, index) =>
                                Divider(color: Colors.grey),
                            itemBuilder: (context, index) {
                              Products prods = snapshot.data[index];
                              return ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductOverviewScreen.routeName,
                                      arguments: prods.product_name);
                                },
                                title: Text('${prods.product_name}'),
                                subtitle: Text('${prods.product_id}'),
                              );
                            });
                      }
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }));
  }
}
