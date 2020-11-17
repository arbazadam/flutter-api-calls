import 'dart:convert';
import 'package:first_app/models/Products.dart';
import 'package:first_app/models/Todos.dart';
import 'package:http/http.dart' as http;

class HttpWorkloads {
  static Future<Todos> getTodos() async {
    const url = 'https://jsonplaceholder.typicode.com/todos/1';
    final response = await http.get(url);
    return Todos.fromJson(json.decode(response.body));
  }

  static Future<Products> getSingleProduct() async {
    const url = 'http://192.168.0.143:8080/';
    final response = await http.get(url);
    return Products.fromMap(json.decode(response.body));
  }

  static Future<List<Products>> getAllProducts() async {
    const url = 'http://192.168.0.143:8080/getAll';
    final response = await http.get(url);
    final listOfMaps = jsonDecode(response.body) as List<dynamic>;

    final list = listOfMaps
        .map((item) => Products(
            product_id: item['id'], product_name: item['product_name']))
        .toList();
    return list;
  }
}
