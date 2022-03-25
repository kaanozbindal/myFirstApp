import 'package:exercise/models/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget {
  @override
  late Student selectedStudent;
  StudentUpdate(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentUpdate(selectedStudent);
  }
}

class _StudentUpdate extends State {
  @override
  var upKey = GlobalKey<FormState>();
  late Student selectedStudent;
  _StudentUpdate(Student selected) {
    this.selectedStudent = selected;
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ogrenci bilgilerini guncelleyin'),
        backgroundColor: Colors.green,
      ),
      body: buildBodyUp(),
    );
  }

  Widget buildBodyUp() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(19.0),
      child: Form(
        key: upKey,
        child: Column(
          children: [
            updateFirstNameField(),
            updateLastNameField(),
            updateGradeField(),
            updateSubmitButton()
          ],
        ),
      ),
    );
  }

  Widget updateFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.name,
        onSaved: (String? firstName) {
          this.selectedStudent.name = firstName.toString();
        },
        decoration:
            InputDecoration(hintText: "kaan", labelText: "yeni ismi giriniz"),
        validator: (String? value) {
          return (value != null && value.length < 2) ? "isminiz iki karakterden kisa olamaz " : null;
        });
  }

  Widget updateLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      onSaved: (String? lastName) {
        this.selectedStudent.lastName = lastName.toString();
      },
      decoration: InputDecoration(
          hintText: "ozbindal", labelText: "yeni soyismi giriniz"),
         validator: (String? lastName){
             return(lastName!=null && lastName.length<2) ? "soyisminiz iki karakterden kisa olamaz" : null;
         },
    );
  }

  Widget updateGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      onSaved: (String? grade) {

        this.selectedStudent.grade = int.parse(grade.toString());
      },
      decoration:
          InputDecoration(hintText: "80", labelText: "yeni notunuzu giriniz"),
      validator: (String? grade) {
        var point = int.parse(grade.toString());
        return (grade != null && (point > 101 && point < 0) ? " " : null);
      },
    );
  }

  Widget updateSubmitButton() {
    return RaisedButton(
      onPressed: () {
        if(upKey.currentState!.validate()){
             upKey.currentState!.save();
             print(selectedStudent.name);
             print(selectedStudent.lastName);
             print(selectedStudent.grade);
        }
      },
      child: Text("bilgileri guncelle"),
    );
  }
}
