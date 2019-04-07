import 'package:flutter/material.dart';
import './Addform.dart';
import '../Data/Todo.dart';

class Task extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskState();
  }
}

class TaskState extends State<Task> {
  TodoProvider todo = TodoProvider();
  List<Todo> tasklist = List();
  bool showDialog  = false;

  @override
  void initState() {
    super.initState();
    todo.open().then((d) {
      alltask();
    });
  }

  void alltask() {
    todo.task().then((d) {
      setState(() {
        tasklist = d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Todo"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_comment),
              onPressed: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Addform()));
                });
              }
            ),
          ],
        ),
      body: Center(
        child: tasklist.length == 0 ? Text("data not found")
        :ListView(
          children: tasklist.map((item){
              return CheckboxListTile(
                title: Text(item.title),
                value: item.done, 
                onChanged: (bool value) {
                  setState(() {
                  item.done = value;
                  todo.update(item);
                  alltask(); 
                  });
                },
              );
            }).toList(),
        ),
  
      ),
 
    );
  }
}