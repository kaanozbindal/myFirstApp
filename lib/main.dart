import 'dart:ffi';
import 'package:exercise/models/student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String appName = "ogrenci takip sistemi";

  String seciliOgrenci = "abc";

  List<Student> students = [
    new Student("kaan", "ozbındal", 75),
    new Student("atakan", "ozbindal", 45),
    new Student("muhammet", "ceylan", 25)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: buildBody(context));
  }

  String sonucDon(int puan) {
     return "kaan wins all time";
  }

  void alertGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sonucunuz"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://w0.peakpx.com/wallpaper/589/478/HD-wallpaper-duvar-kagidi-new-game-zar-siyah.jpg"),
                    ),
                    title: Text(
                        students[index].name + " " + students[index].lastName),
                    subtitle: Text("sinavdan aldigi not " +
                        students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      seciliOgrenci = students[index].name+" "+students[index].lastName;
                      //print(seciliOgrenci);
                      Text(seciliOgrenci);

                    } ,
                  );
                })),
        Text("secili ogrenci "+seciliOgrenci),
        Center(
          child: RaisedButton(
              child: Text("sonucu gorelim1111"),
              onPressed: () {
                var message = sonucDon(25);
                alertGoster(context, message);
              }),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
