import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor=Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("YOUR BMI"),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter Your Weight (in kgs)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height (in feet))"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height (in inchis)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inch = inchcontroller.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);
                        var msg ="";
                        if(bmi>25){

                          msg ="You are OverWeight!!";
                              bgcolor =Colors.orange.shade200;
                        }else if(bmi<18){
                          msg ="You are UnderWeight !!";
                          bgcolor =Colors.red.shade200;

                        }else {
                          msg ="You are Healthy!!";
                          bgcolor =Colors.green.shade200;
                        }

                        setState(() {
                          result = "$msg\nYour current BMI is : ${bmi.toStringAsFixed(3)}";
                        });
                      } else {
                        result = "Please fill all the required blanks !!";
                      }
                    },
                    child: Text(
                      "Calculator",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blue)),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
