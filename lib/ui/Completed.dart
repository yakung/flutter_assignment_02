import 'package:flutter/material.dart';
class Completed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CompletedState();
  }
}

class CompletedState extends State<Completed> {
  TextEditingController eCtrl = TextEditingController();
  final List<String> _text = [];
  bool showDialog = false;
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
                  showDialog = true;
                if(showDialog == true){
                  
                }
                });
              }
            ),
          ],
        ),
      body: Center(
        child:Text("No data kub"),
      ),
 
    );
  }
}