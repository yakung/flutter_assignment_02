import 'package:flutter/material.dart';
class MycustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MycustomForm> {
  TextEditingController eCtrl = TextEditingController();
  final List<String> _text = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: eCtrl,
            decoration: InputDecoration(
              hintText: "Input"
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            child: Text("data"), 
            onPressed: () {
              _text.add(eCtrl.text);
              eCtrl.clear();
            },
          ),
          Flexible(
            child: new ListView.builder(
              itemCount: _text.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: <Widget>[
                    new Text(_text[index])
                  ],
                );
              },
            ),
          )
        ],
      ),
 
    );
  }
}