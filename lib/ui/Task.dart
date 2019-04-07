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
  List<Todo> tasklist = List<Todo>();
  bool showDialog  = false;

  @override
  void initState() {
    super.initState();
    todo.open().then((r) {
      task();
    });
  }

  void task() {
    todo.task().then((r) {
      setState(() {
        tasklist = r;
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
                  showDialog = true;
                if(showDialog == true){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Addform()));
                }
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
                value: item.done, 
                onChanged: (bool value) {
                  setState(() {
                  item.done = value;
                  todo.update(item);
                  task(); 
                  });
                },
              );
            }).toList(),
        ),
  
      ),
 
    );
  }
}