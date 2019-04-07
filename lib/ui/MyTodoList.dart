import 'package:flutter/material.dart';
import './Addform.dart';
import './Task.dart';
import './Completed.dart';
class MyTodoList extends StatefulWidget{
  @override
  TodoListState createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<MyTodoList> {
  int _currentIndex = 0;
  final List<Widget> _home = [
    Task(),Completed()
  ];
    bool showDialog = false;

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body:Center(
          child: _home[_currentIndex]
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