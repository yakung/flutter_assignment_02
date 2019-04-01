import 'package:flutter/material.dart';
import './Addform.dart';
class MyTodoList extends StatefulWidget{
  @override
  TodoListState createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<MyTodoList> {
  int _currentIndex = 0;
  TextEditingController text = TextEditingController();
  // final List<Widget> _home = [
  //   Text("No data found.",style: TextStyle(fontSize: 20)),
  //   Text("Notify",style: TextStyle(fontSize: 20)),
  // ];
    bool showDialog = false;
    // final List1<String> _text = [];
    // bool  List2<bool> _check = [];

  @override
  Widget build(BuildContext context){
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MycustomForm()));
                }
                });
              }
            ),
          ],
        ),
        body:Column(
          children: <Widget>[
            new ListView(
              children: <Widget>[
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ],      
        ),
        bottomNavigationBar:new Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
          ),
        child:BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              title: Text("Task"),
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Completed")
            ),
          ],
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      );
  }
}