import 'package:bue/todolistapi/domain/api_service.dart';
import 'package:bue/todolistapi/model/todo.dart';
import 'package:flutter/material.dart';

class TodoListApiScreen extends StatefulWidget {
  const TodoListApiScreen({super.key});

  @override
  State<TodoListApiScreen> createState() => _TodoListApiScreenState();
}

class _TodoListApiScreenState extends State<TodoListApiScreen> {
  late Future<List<Todo>> listOfTodos;
  @override
  void initState() {
    super.initState();
    listOfTodos = fetchToDoList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List API"),
      ),
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: listOfTodos,
          builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: Checkbox(
                    value: snapshot.data![index].completed,
                    onChanged: (bool? value) {},
                  ),
                  title: Text(snapshot.data![index].title),
                );
              });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
