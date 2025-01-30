/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BmiState();
}
class BmiState extends State<BmiPage>{

  TextEditingController cmController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  
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
              Container(child: Image.asset("$image",)),
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
                    label: Text("Weight",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: Colors.grey)),
                    hintText: "Enter in KG",
                    hintStyle: TextStyle(color: Colors.grey,fontFamily: "Poppins",fontSize: 16),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey,width: 1.5)
                    ),
                  ),

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
                    label: Text("Height",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: Colors.grey)),
                    hintText: "Enter in CM",
                    hintStyle: TextStyle(color: Colors.grey,fontFamily: "Poppins",fontSize: 16),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey,width: 1.5)
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
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
                  }else{
                    bmi=0;
                    fit="";
                    image="asset/image/banner-bmi.png";
                  }
                  setState(() {

                  });

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
}*/


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BmiState();
}

class _BmiState extends State<BmiPage> {
  final TextEditingController cmController = TextEditingController();
  final TextEditingController kgController = TextEditingController();

  num bmi = 0;
  String bmiCategory = "";
  String image = "asset/image/banner-bmi.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Text('BMI',
                style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 25,
                    color: Colors.black)),
            Text(' Calculator',
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: 20, color: Colors.black)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              Image.asset(image),
              const SizedBox(height: 10),
              if (bmi != 0)
                Text(
                  "BMI: ${bmi.toStringAsFixed(1)}",
                  style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 25,
                      color: _getColor()),
                ),
              if (bmiCategory.isNotEmpty)
                Text(
                  bmiCategory,
                  style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 30,
                      color: _getColor()),
                ),
              const SizedBox(height: 20),
              _buildTextField(
                  controller: kgController,
                  label: "Weight",
                  hint: "Enter in KG"),
              const SizedBox(height: 20),
              _buildTextField(
                  controller: cmController,
                  label: "Height",
                  hint: "Enter in CM"),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _calculateBmi,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1.5, 1.5),
                          color: Colors.black,
                        )
                      ]),
                  child: Center(
                      child: Text('Calculate',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
        required String label,
        required String hint}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          fontSize: 17),
      decoration: InputDecoration(
        label: Text(label,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey)),
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.grey, fontFamily: "Poppins", fontSize: 16),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber, width: 2),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1.5)),
      ),
    );
  }

  void _calculateBmi() {
    if (kgController.text.isNotEmpty && cmController.text.isNotEmpty) {
      try {
        final num kg = double.parse(kgController.text);
        final num cm = double.parse(cmController.text);

        if (kg > 0 && cm > 0) {
          final num height = cm / 100;
          setState(() {
            bmi = kg / (height * height);
            if (bmi < 18.5) {
              bmiCategory = "Underweight";
              image = "asset/image/unfit.png";
            } else if (bmi < 24.9) {
              bmiCategory = "Normal";
              image = "asset/image/fit.png";
            } else {
              bmiCategory = "Overweight";
              image = "asset/image/overfit.png";
            }
          });
        }
      } catch (e) {
        // Handle parsing errors
        setState(() {
          bmi = 0;
          bmiCategory = "Invalid input";
          image = "asset/image/banner-bmi.png";
        });
      }
    } else {
      setState(() {
        bmi = 0;
        bmiCategory = "";
        image = "asset/image/banner-bmi.png";
      });
    }
  }

  Color _getColor() {
    switch (bmiCategory) {
      case "Normal":
        return Colors.green;
      case "Underweight":
        return Colors.orange;
      case "Overweight":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
