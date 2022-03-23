import 'package:exercise/Validation/Student_validation.dart';
import 'package:exercise/models/student.dart';
import 'package:flutter/material.dart';

 class StudentAdd extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState();
  }
 }

class _StudentAddState extends State with StudentValidationMixin{
  @override
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
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

    String kaan="kaan";
       return Container(
         key: formKey,
         margin: EdgeInsets.all(20.0),
         padding: EdgeInsets.all(25),
         child: Form(
           child: Column(
             children: [
               buildFirstNameField(),
               buildLastNameField(),
               buildGradeField(),
               buildSubmitButton()
             ],
           )
         ),
       );
  }

 Widget buildFirstNameField() {
  return TextFormField(
     decoration: InputDecoration(labelText: "Ogrencini  adi",hintText: "Kaan"),
     onSaved: (String? value){
       student.name = value.toString();

     },
     validator: (String? value){
       return (value!= null && value.length<2) ? 'en az iki karakterli bir isim giriniz ' : null;
     },


   );
 }

 Widget buildLastNameField() {
     return TextFormField(
      decoration: InputDecoration(labelText: "Ogrencinin soyadi",hintText: "Ozbindal"),
      onSaved: (String? value){
        student.lastName = value.toString();

      },
      validator: (String? value){
        return (value!= null && value.length<2) ? 'Soyadı en az 2 karakter olmalıdır ' : null;
      },


    );
 }

 Widget buildGradeField() {
   return TextFormField(
     decoration: InputDecoration(labelText: "Ogrencinin notu",hintText: "80"),
     onSaved: (String? value){
       student.grade = int.parse(value.toString());

     },
    validator: (String? value){
       var grade = int.parse(value.toString());
       return (value!= null && (grade<0||grade>100)) ? 'ogrencinin aldigi not 0 ile 100 arasinda olmalidir ' : null;
    },


   );
 }

 Widget buildSubmitButton() {

    return RaisedButton(
      child: Text('bilgileri kaydet'),
        onPressed: (){

           if(formKey.currentState.validate()){
             formKey.currentState.save();
           }
        },
    );
 }


}