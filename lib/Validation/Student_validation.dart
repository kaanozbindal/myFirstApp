class StudentValidationMixin{
  String? ValiDateFirstName(String? value){
 if(value.toString().length<2){
    return "isim en az iki karakterden olusmalidir";
  }
 if(value.toString().isEmpty){
   return "do something bro";
 }



}
}