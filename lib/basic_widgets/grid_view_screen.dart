import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NmI944yvv3Y3w9_u3AjFgYmREmLnuARJhPW7NOfYGw&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Example"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, int index){
            return Image.network(images[index]);
            }),
      ),
    );
  }
}
