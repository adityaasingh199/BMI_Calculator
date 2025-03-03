
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BmiState();
}
class BmiState extends State<BmiPage>{

  TextEditingController cmController = TextEditingController();
  TextEditingController kgController = TextEditingController();

  bool checker = false;
  bool checker2 = false;
  void trigger() {
    checker = cmController.text.isEmpty;
   setState(() {

   });
  }
  void trigger2(){
    checker2 = kgController.text.isEmpty;
   setState(() {

   });
  }



  
  num bmi=0;
  String fit="";
  String image="asset/image/banner-bmi.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Text('BMI',style: TextStyle(fontFamily: "PoppinsBold",fontSize:25,color: Colors.black)),
            Text(' Calculator',style: TextStyle(fontFamily: "Poppins",fontSize:20,color: Colors.black)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10,),
              Container(
                  height: 380,
                  child: Image.asset("$image",)),
              SizedBox(height: 10,),
              bmi!=0 ?Text("BMI: ${bmi.toStringAsFixed(1)}",style: TextStyle(fontFamily: "PoppinsBold",fontSize:25,color:getcolor())):Container(),
              fit!="" ?Text("$fit",style: TextStyle(fontFamily: "PoppinsBold",fontSize:30,color:getcolor()),):Container(),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  controller: kgController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 17),
                  decoration: InputDecoration(
                    label: Text("Weight",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: checker2 ? Colors.red : Colors.grey)),
                    hintText: "Enter in KG",
                    hintStyle: TextStyle(color: Colors.grey,fontFamily: "Poppins",fontSize: 16),
                   errorText: checker2 ? "Please Enter the value" : null,
                      errorStyle: TextStyle(color: Colors.red),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1),borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber,width: 2),borderRadius: BorderRadius.circular(10)),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: checker2 ? Colors.red :Colors.amber,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:checker2 ? Colors.red : Colors.grey,width: 1.5)
                    ),
                  ),
                  /// Disable long-press zoom effect
                  magnifierConfiguration: TextMagnifierConfiguration.disabled,
                  /// Disable copy paste feature and long-press
                  contextMenuBuilder: (_,__)=>Container(),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  controller: cmController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 17),
                  decoration: InputDecoration(
                    label: Text("Height",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: checker ? Colors.red : Colors.grey)),
                    hintText: "Enter in CM",
                    errorText: checker ? "Please Enter the value" : null,
                    errorStyle: TextStyle(color: Colors.red),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1),borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber,width: 2),borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(color: Colors.grey,fontFamily: "Poppins",fontSize: 16),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: checker ? Colors.red : Colors.amber,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: checker ? Colors.red : Colors.grey,width: 1.5)
                    ),
                  ),
                  /// Disable long-press zoom effect
                  magnifierConfiguration: TextMagnifierConfiguration.disabled,
                  /// Disable copy paste feature and long-press
                  contextMenuBuilder: (_,__)=>Container(),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(cmController.text.isEmpty){
                    trigger();
                  }else{
                    trigger();
                    checker=false;
                  }
                  if(kgController.text.isEmpty){
                    trigger2();
                  }else{
                    trigger2();
                    checker2=false;
                  }


                  if (kgController.text.isNotEmpty &&
                      cmController.text.isNotEmpty) {
                    num kg = double.parse(kgController.text.toString());
                    num cm = double.parse(cmController.text.toString());

                    num height = cm/100;
                    bmi = kg / (height * height);
                    if (bmi < 18.5) {
                      fit = "Underweight";
                      image="asset/image/unfit.png";
                    } else if (bmi >= 18.5 && bmi < 24.9) {
                      fit = "Normal";
                      image="asset/image/fit.png";
                    } else if (bmi >= 25) {
                      fit = "Overweight";
                      image="asset/image/overfit.png";
                    }
                    setState(() {

                    });

                  }else{
                    bmi=0;
                    fit="";
                    image="asset/image/banner-bmi.png";

                    setState(() {

                    });

                  }

                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      offset: Offset(1.5, 1.5),
                      color: Colors.black,
                    )
                    ]
                  ),
                  child: Center(child: Text(' Calculate',style: TextStyle(fontFamily: "Poppins",fontSize:22,fontWeight:FontWeight.bold,color: Colors.black))),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),

    );
  }
  Color getcolor(){
    if(fit=="Normal"){
      return  Colors.green;
    }else if(fit=="Underweight"){
      return  Colors.orange;
    }else if(fit=="Overweight"){
      return Colors.red;
    }else{
      return Colors.black;
    }
  }
}
