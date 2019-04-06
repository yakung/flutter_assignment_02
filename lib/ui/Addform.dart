import 'package:flutter/material.dart';
class Addform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddformState();
  }
}

class AddformState extends State<Addform> {
  TextEditingController ectrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
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
            TextFormField(
              controller: ectrl,
              decoration: InputDecoration(
                labelText: "Subject",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "please fill subject";
                }
              },
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: () {
                _formkey.currentState.validate();
                // String txt = ectrl.text;
                // if(txt.isEmpty){

                // }
              },
            )
          ],
        ),
      ),
    );
  }
}