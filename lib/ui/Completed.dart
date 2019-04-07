import 'package:flutter/material.dart';
import '../Data/Todo.dart';
class Completed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CompletedState();
  }
}

class CompletedState extends State<Completed> {
  TextEditingController eCtrl = TextEditingController();
  TodoProvider todo = TodoProvider();
  List<Todo> completedlist = List();
  bool showDialog = false;

  @override
  void initState() {
    super.initState();
    todo.open().then((d) {
      alltask();
    });
  }

  void alltask() {
    todo.completed().then((d) {
      setState(() {
        completedlist = d;
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
              icon: new Icon(Icons.delete_forever),
              onPressed: (){
                setState(() {
                  todo.deleteall();
                  alltask();
                });
              }
            ),
          ],
        ),
      body: Center(
        child: completedlist.length == 0 ? Text("data not found")
        :ListView(
          children: completedlist.map((item){
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