import 'package:flutter/material.dart';
import './Addform.dart';
class Task extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskState();
  }
}

class TaskState extends State<Task> {
  TextEditingController eCtrl = TextEditingController();
  final List<String> _text = [];
  bool showDialog  = false;
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
        child:Text("No data"),
      ),
 
    );
  }
}