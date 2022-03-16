
class Student{
 late String name;
 late String lastName;
 late int grade;
 late String status;

 Student(String name,String lastName,int grade){
  this.name=name;
  this.lastName=lastName;
  this.grade=grade;

 }
  String get getName{

   return "Ogr -"+this.name;
 }

 void set setName(String value){
  this.name=value;
 }

 String get getStatus{
  String message=" ";
  if (this.grade >= 50) {
   message = "gectiniz";
  } else if (this.grade > 40) {
   message = "butunleme";
  } else {
   message = "kaldiniz";
  }
  return message;
 }



}