import 'package:flutter/material.dart';

 class StudentAdd extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState();
  }
 }

class _StudentAddState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ogrenci  ekleme sayfasi'),
      ),
      body: buildBody(context),
    );

  }
  Widget buildBody(BuildContext context){
       return Center(child: Text("kaanaak"),);
  }


}