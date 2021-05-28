

import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey,
  padding: EdgeInsets.all(40.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
 
 int firstval=0;
   int secondval=0;
   String displaytext='';
   String result='';
   String operatortoperform='';
  void btnclicked(String bvalue){
    if(bvalue=='C'){
      firstval=0;
      secondval=0;
      result=''; 
      displaytext='';
    }
    else if(bvalue=='+'||bvalue=="-"||bvalue=='x'||bvalue=='/' ||bvalue=="%"||bvalue=="(a+b)^2"||bvalue=="(a+b)^3"||bvalue=="x^2"||bvalue=="x^3"){
      firstval=int.parse(displaytext);
      result='';
      operatortoperform = bvalue;
    } else if(bvalue == "="){
      if (operatortoperform=="x^2")
       { 
        result=(firstval * firstval).toString();
       }else
        if (operatortoperform=="x^3"){
         result=(firstval * firstval * firstval).toString();
        }else
          if(operatortoperform=='+'){
          secondval=int.parse(displaytext);
          result=(firstval+secondval).toString();
          }else
          if(operatortoperform=='-'){
          secondval=int.parse(displaytext);
          result=(firstval-secondval).toString();
          }else 
          if(operatortoperform=='x'){
          secondval=int.parse(displaytext);
          result=(firstval*secondval).toString();
           }else 
          if(operatortoperform=='%'){
          secondval=int.parse(displaytext);
          result=(firstval * secondval /100).toString();
           }else 
          if(operatortoperform=="/"){
          secondval=int.parse(displaytext);
          result=(firstval ~/ secondval).toString();
          }else 
          if(operatortoperform=="(a+b)^2")
          {
          secondval=int.parse(displaytext);
          result=((firstval * firstval) + (secondval * secondval) + 2 * firstval *secondval).toString();
          }else
          if(operatortoperform=="(a+b)^3"){
          secondval=int.parse(displaytext);
          result=(
          (firstval * firstval * firstval) + (secondval * secondval *secondval) + 3 * (firstval * secondval) * (firstval +secondval)

          ).toString();
        
        }
    }
    else{
      result = int.parse(displaytext + bvalue).toString();
    }

    setState(() {
      displaytext = result;
    });

  }
  Widget localbutton(String bvalue){
    return Expanded( 
      child: ElevatedButton(
   onPressed: () => btnclicked(bvalue),
  child: Text('$bvalue',
   style: TextStyle(
            color: Colors.black,
            fontFamily: "MateSC-Regular.ttf",
            fontSize: 35.0,
            
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),),
)

    
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: IconButton(onPressed:(){}, icon: Icon(Icons.calculate)),
          title: Text(
            "Calculator",
            style: TextStyle(
              fontFamily: "fonts/MateSC-Regular.ttf",
            ),
            
          ),
        ),
        body: Container(
          color: Colors.grey[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                  Container(
                  height: 90.0,
                  decoration: BoxDecoration(color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                  border:Border.all(color:Colors.blueGrey,
                  width: 5
                  )),
                  
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  "$displaytext",
                  style: TextStyle(
                      fontFamily: "MateSC-regular.ttf",
                      fontSize: 40.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      ),
                ),
                  ),
              SizedBox(height:30),
              Row(
                children:[
                SizedBox(width: 10),
                localbutton("(a+b)^3"),
                SizedBox(width:10),
                localbutton("(a+b)^2"),
                SizedBox(width: 10),
                ]
              ),
              SizedBox(height:10.0),
              Row(
                children: [
                  SizedBox(width:10.0),
                  localbutton("C"),
                  SizedBox(width: 10.0),
                  localbutton("x^2"),
                  SizedBox(width: 10.0),
                  localbutton("x^3"),
                  SizedBox(width: 10.0),
                  localbutton("%"),
                  SizedBox(width:10.0),
                ],
              ),
              SizedBox(height:10.0),
              Row(
                children: [
                  SizedBox(width:10.0),
                  localbutton("9"),
                  SizedBox(width: 10.0),
                  localbutton("8"),
                  SizedBox(width: 10.0),
                  localbutton("7"),
                  SizedBox(width: 10.0),
                  localbutton("+"),
                  SizedBox(width:10.0),
                ],
              ),
              SizedBox(height:10.0),
              Row(
                children: [
                  SizedBox(width:10.0),
                  localbutton("6"),
                  SizedBox(width: 10.0),
                  localbutton("5"),
                  SizedBox(width: 10.0),
                  localbutton("4"),
                  SizedBox(width: 10.0),
                  localbutton("-"),
                  SizedBox(width:10.0),
                ],
              ),
              SizedBox(height:10.0),
              Row(
                children: [
                  SizedBox(width:10.0),
                  localbutton("3"),
                  SizedBox(width: 10.0),
                  localbutton("2"),
                  SizedBox(width: 10.0),
                  localbutton("1"),
                  SizedBox(width: 10.0),
                  localbutton("x"),
                  SizedBox(width:10.0),
                ],
              ),
              SizedBox(height:10.0),
              Row(
                children: [
                  SizedBox(width:10.0),
                  localbutton("="),
                  SizedBox(width: 10.0),
                  localbutton("0"),
                  SizedBox(width: 10.0),
                  localbutton("00"),
                  SizedBox(width: 10.0),
                  localbutton("/"),
                  SizedBox(width:10.0)
                ],
              ),
              SizedBox(height:10.0),
            ],
          ),
        ));
  }
}
