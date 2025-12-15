import 'package:flutter/material.dart';

main() {
  // print("Hello World");
  // print(5);
  // print(32+31);
  // print(true);
  // print(false);
}

/*
----
--
--
-

data types
in
Dart ----
--
--
-
1
.
Numbers

🔹 init :

sirf integers
(
whole numbers ) ke liye use hota hai,
( init age = 22 )
🔹 double : Decimal numbers ( floating point values ) ke liye use hita hai,
( double pi = 3.14 )
🔹 num : int + double dono handie kar sakta hai
( num x = 10
x = 10.5 )
------------------
2. String

🔹 string : Text ko represent karne ke liye use hoto hai
( String s1 = 'sherry';
String s2 = "sherry";
String s3 = '''sherry''';
String s4 = """sherry""";
String s5 = "it's sherry";
String s6 = "hello"
"fello"
"shello"
"mallo"
"pallo"
"chousslo"
"sherry";
String Interpolation
String s6 = "hussain";
String s7 = 'sherry $s6';
Area of recatngle s8 * s9
int s8 = 10;
int s9 = 20;
print("Area of rectangle is ${s8 * s9}");
When we never want to change the value of variable.
const vs final keywords

final ad = 10; initialized on runtime
ab = 32;
const cd = 21;initialized on compile time
cd = 321;

if else statemant

const a = 10;
const b = 50;

if (a== b){
print('$a is positive');
}else{
print("$a is negative");
}

const marks = 1 ;

if(marks > 80 && marks <= 100){
print("A");
}else if( marks > 60 && marks < 80 ){
print("B");
}else if( marks > 35 && marks < 60 ){
print("C");
}else if ( marks > 0 && marks < 35 ){
print("Fail");
}

Ternary Operator
var num1 = 100 ;
var num2 = 20 ;

(num1 > num2) ? print('a is large'): print('$num2 is large') ;

Switch Case

int num1 = 20 ;
int num2 = 50 ;

var operation = "-" ;

switch (operation){
case '+': print(num1 + num2) ;
return;
case '-': print(num1 - num2) ;
return;
case '*': print(num1 * num2) ;
return;

increment operator
decremment operator

post increment operator

int q = 5 ;
int a = q-- ;

print('q , $q') ;
print('a++ ,  $a');
print('++a ,  $a');

post decremment operator

print('q , $q') ;
print('a-- ,  $a');
print('--a ,  $a');


For Loop


var a = ['sherry' , 'zeeshan' , 'vddfvf','ewfewfeef' , ' wewewewr' , 'ewrwerw','wwewwe','weewewew' ,'weewwewwe','wewere'] ;

for(int i = 1 ; i < a.length ; i++){
print('$i HELLO ${a[i]} ');
}
While Loop


List a = ['sherry' , 'zeeshan' , 'vddfvf','ewfewfeef' , ' wewewewr' , 'ewrwerw','wwewwe','weewewew' ,'weewwewwe','wewere'] ;

int i = 0 ;

while( i < a.length ){
print('hello ${a[i]} ');
i++;
}

Do While Loop

List a = ['sherry' , 'zeeshan' , 'vddfvf','ewfewfeef' , ' wewewewr' , 'ewrwerw','wwewwe','weewewew' ,'weewwewwe','wewere'] ;

int i = 11;

do{
print(i);
i++;
}while( i <=a.length );


brack statement

for(int i=1 ; i<= 10 ; i++){
print('i1 $i');
if(i == 5){
break;
}
print('i2 $i');
}


optional positinal parameter

animal([ String? name , int? age]){

print(name ?? 'animal');
print(age ?? 43);
}

animal( );

optional Named parameter

animal({String? name , int? age}){

print(name);
print(age );
}

animal(  );
}

//   defining calss and odjects

  var Student1 = new Student();
  var Student2 = new Student();

  Student1.rollnumber = 21;
  Student1.name = 'sherry';
  Student1.study();
  Student1.sleep();
  print('${Student1} , Student1');



   Student2.rollnumber = 18;
  Student2.name = 'sherry hussain';
   Student2.study();
  Student2.sleep();
  print('${Student2} , Student2');


class Student  {

  int? rollnumber;  //   default value is null
  String? name ; //   instance variable or field variable
 study(){
   print('$name hello');
 }
  sleep(){
  print('$name bay');
 }
  String toString() {
    return 'student(name: $name , rollnumber , $rollnumber)'; -

 inheritance



  Dog objDog = Dog();
  objDog.color = 'green';
  objDog.bark();

  Cat objCat = Cat();
  objCat.age = 29 ;
   print(objCat);
  objCat.meow();
  }

class Animal {
  String? color;
  int? age;

  void eat(){
    print('eating');
  }


}
class Dog extends Animal{
  void bark(){
    print('dog is barking');
  }
}

class Cat extends Animal{
  void meow(){
    print('cat is meowing');
  }

   String toString(){
    return 'Animal(name : $color , rollNumber : $age)';
   }


 Method Overriding // Polymorphism



  Bike obj = Bike();
  obj.age = 20;
  obj.color = 'RED';
  obj.move();
  print(obj);

  }

class Bike {
  String? color;
  int? age;

  void move(){
    print(' Bike is Moving');
  }


}
class Cycle extends Bike{
  void move(){
    print('Cycle is Moving');
  }
}

class Cat extends Cycle{
  void move(){
    super.move();
    print('cat is meowing');
  }

   String toString(){
    return 'Bike(Color : $color , age : $age)';
   }


 Inheritance With Drfault Constructor
//   Inheritance With Parametrized Constructor
//   Inheritance With Named Constructor



  Cycle obj = Cycle();
  Cycle.myNamedCycleConstor('red');


  }

class Bike {
  String? color;

   Bike(){
    print('this is bike const');
  }
}

class Cycle extends Bike{
  int? price;

  Cycle(){
    print('this is cycle const');
  }
  Cycle.myNamedCycleConstor(String color){
    print('name constructor of cycle ');
  }  
//   lambda function , anonmous funtion
//   without name

//  Function sum = (int a , int b){
//     int sum = a + b ;
//     print(sum);
//   };

//   sum(20 , 50);
// }

// Function aquare = (int n){

//   return n *n;

// };
// aquare(9);

//   higher order function

//   Function addTwoNumber = ( int a , int b) => a+b;

//   myNewFunction("hello" ,addTwoNumber );

// }

// myNewFunction(String msg , Function summation){

//   print('$msg msg');
//   print('$summation(10,30) summation');
// }



// dart collections // list //array
//   fixed // growable

//   var arr = [1,2,3,4,5];

//   var fixedLLenghthList = List<int>.filled(5,8
// , growable : false);

//   fixedLLenghthList[3] = 6;
//   fixedLLenghthList[2] = 5;
//   fixedLLenghthList[1] = 4;
//   fixedLLenghthList[0] = 3;


//   print(fixedLLenghthList);

  //   growable

//     var growableLenghthList = List<int>.filled(0,0
// , growable : true);


//   growableLenghthList.add(2);
//   growableLenghthList.add(25);
//   growableLenghthList.add(549);
//   growableLenghthList.add(1092);
//   growableLenghthList.add(10921);
//   growableLenghthList.add(151091);
//   growableLenghthList.add(2311092);
//   growableLenghthList.add(13210921);
//   growableLenghthList.add(112610921);
//   growableLenghthList.add(1112610921);

//   growableLenghthList.remove(10928);
//   growableLenghthList.removeAt(1);
//   var elem = growableLenghthList.elementAt(1);
//   print( elem );

//   growableLenghthList.clear();

//     print(growableLenghthList);

//   for(int element in growableLenghthList){
//     print(element);
//   }

//   for(int i = 0; i <growableLenghthList.length;  i++){
//     print(growableLenghthList[i]);
//   }

//   growableLenghthList.forEach((element) =>{
//     print(element)
//   });

//   dart collections // set


//    Set <int> growableLenghthList =Set();

//   growableLenghthList.add(2);
//   growableLenghthList.add(25);
//   growableLenghthList.add(549);
//   growableLenghthList.add(1092);
//   growableLenghthList.add(10921);
//   growableLenghthList.add(151091);
//   growableLenghthList.add(2311092);
//   growableLenghthList.add(13210921);
//   growableLenghthList.add(112610921);
//   growableLenghthList.add(1112610921);
//   growableLenghthList.add(1112610921);

//    print(growableLenghthList);


//   growableLenghthList.forEach((element) =>{
//     print(element)
//   });


// mixin in dart


//   Bartender b = Bartender();
//   b.
//   Medical  m = Medical();
//   Doctor d = Doctor ();

//   mixin Medical {
//     takeTemp(){}
// }

// mixin Medical1 {
//     takeTemp(){}
// }

// class Employee{
//   clockIn(){}
// }


// class Doctor extends Employee with Medical ,Medical1 {
//   operation(){}
// }
// class Nurse extends Employee with Medical{
//   takeCarePatient(){}
// }

// class Bartender extends Employee{
//   clockIn(){}
// }


//   extension are way to add functionalty to exsting libraries

//   60.toWord;


//   var date = DateTime.now();

//   print(date.myCustomData);
// }



// extension on DateTime {
//   get myCustomData{
//    return "${this.day}/${this.month}/${this.year}";
//   }


//   singleton cless in flutter

//   The singleton pattern is a pattent used in object-oriente prc //   which ensures that a class has only one instance
//   and alos provides a global for point of access to it.
//   sometime it's important for a class to have exactly
//   one instance.


//  NarmalClass ob = NarmalClass();
//   ob.a = 'vivek';

//   Singletion ob1 = Singletion();
//   ob1.a = 'rakshan';
//   print(ob1.a);

//   Singletion ob2 = Singletion();
//   ob2.a = 'sherry';
//   print(ob2.a);
// }



// class NarmalClass{
//   String? a;
// }

// class Singletion{
//   Singletion.internal();

//   static final Singletion _instance = Singletion.internal();

//   factory Singletion(){
//     return _instance;
//   }
//   String? a;



//   String methods example

//   String str = "Hello World !";

//   charAt
//   print(str[1] );


//   contains
//   print(str.contains("!" ));

//   inde of character
//   print(str.indexOf("o"));

//   //  last inde of character
//   print(str.lastIndexOf("o"));

//   swapping two numbers without using third variable

//   var a = 10;

//   var b = 20;

//   print("before swap a $a b $b");



//   var( a , b , c) = (10 ,20 ,30);

//   print("bafore swap a $a b $b c$c");

//   ( c , b , a) = (a , b , c);

//   print("after swap a $a b $b c$c");

//   temp = a;

//   a  = b ;

//   b = temp;

//   print("after swap a $a b $b");



)
------------------
3. Booleans
🔹 bool : true or false ke liye use hota hai
------------------
4.List ( Arrays )
🔹 List : Multiple values ko store karne ke liye use hota hai
------------------
5.Sets
🔹 set : Multiple values ko store karne ke liye use hota hai
------------------
6.Map (Dictionary / Key-Value pairs)
🔹map : Key-Value pairs ko store karne ke liye use hota hai
------------------
7. Dynamic & var
🔹 dynamic : Type runtime par decide hota hai ( compile-time par fixed nahi hota )
( dynamic variable = 10;
variable = "Hello"; // valid )
( var city = "Karachi";
// ab ye sirf String hi rahega )
------------------
8. Null Safety
🔹 Null : Dart mein null safety hoti hai (by default variables null nahi hote unless ? lagaya jaye).
( String
?
nickname; // null allowed)
runes
symbols
null
dynamic
 */