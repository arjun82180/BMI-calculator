import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home:bmi(),
  ),);
}

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {

  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var inchcontroller=TextEditingController();
  var result="";
  var bgColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body:Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("BMI",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller:wtcontroller,
                decoration:InputDecoration(
                  label: Text("Enter your weight",
                    style:TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.w500
                    ),
                    
                  ),
                  prefixIcon:Icon(Icons.line_weight),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),

                )
                ),
                keyboardType:TextInputType.number,
                
              ),
              SizedBox(height: 11,),
              TextField(
                controller:ftcontroller,
                decoration:InputDecoration(
                  label: Text("Enter your heingh (in ft)",
                    style:TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.w500
                    ),
                  ),

                  prefixIcon:Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )
                ),
                keyboardType:TextInputType.number,
              ),
SizedBox(height:11,),
              TextField(
                controller:inchcontroller,
                decoration:InputDecoration(
                  label: Text("Enter your height( in inch)",style:TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.w500
                  ),),
                  prefixIcon:Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )
                ),
                keyboardType:TextInputType.number,
              ),
              SizedBox(height: 20,),
             ElevatedButton(onPressed:() {
               var wt = wtcontroller.text.toString();
               var ft = ftcontroller.text.toString();
               var inch = inchcontroller.text.toString();

               if (wt!= "" && ft!= "" && inch!= "") {
                 var iwt= int.parse(wt);
                 var ift=int.parse(ft);
                 var iinch=int.parse(inch);

                 var tinch=(ift*12)+iinch;
                 var tc=tinch*2.54;
                 var tm= tc/100;

                 var bmi=iwt/(tm*tm);
                  var msg=" ";

              if(bmi>25){
                msg="your are overweight!!";
                   bgColor=Colors.orange.shade200;
                }
                else if(bmi<18){
                msg="your are under weight!!";
                bgColor=Colors.red.shade400;
              }
              else{
                msg="your are healty";
                bgColor=Colors.green.shade200;
               }

                 setState(() {
                   result=" $msg   \n your bmi is : ${bmi.toStringAsFixed(4)}";
                 });

               } else {
                 setState(() {
                   result = "please fill the all required blanks!!";
                 }
                 );
               }
             },
               child:Text("Calculate"),
               ),

              SizedBox(height: 15,),
              Text(result, style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),

    );
  }
}
