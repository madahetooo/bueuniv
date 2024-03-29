import 'dart:convert';

import '../model/todo.dart';
import 'package:http/http.dart' as http;

Future<List<Todo>> fetchToDoList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> apiResponseMap = json.decode(response.body);
    return apiResponseMap.map((todoMap) {
      return Todo.fromJson(todoMap);
    }).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ToDo List');
  }
}
