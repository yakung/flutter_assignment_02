import 'package:flutter/material.dart';
import '../Data/Todo.dart';

class Addform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddformState();
  }
}

class AddformState extends State<Addform> {
  TextEditingController txtctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  TodoProvider todo = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: txtctrl,
                decoration: InputDecoration(
                  labelText: "Subject",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill subject";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Save"),
                onPressed: () async {
                  _formkey.currentState.validate();
                  if(txtctrl.text.length > 0){
                    await todo.open();
                    Todo data = Todo(title: txtctrl.text);
                    todo.insert(data);
                    print("completed");
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}