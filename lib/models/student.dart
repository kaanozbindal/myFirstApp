
class Student{
 late int id;
 late String name;
 late String lastName;
 late int grade;
 late String status;

 Student.withID(int id,String name,String lastName,int grade){
  this.id=id;
  this.name=name;
  this.lastName=lastName;
  this.grade=grade;

 }
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