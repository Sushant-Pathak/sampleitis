import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your BMI',
      debugShowCheckedModeBanner: false,
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var backcolor = Colors.pink.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YourBMI'),
        ),
        body: Container(
          color: backcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text('Enter Your Weight in KiloGrams'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text('Enter the Height part in Feet'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text('Enter the Height part in Inch'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          //BMI calculation
                          var iWt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var totalinch = (ift * 12) + iinch;
                          var totalcenti = totalinch * 2.54;
                          var totalmeter = totalcenti / 100;
                          var bmi = iWt / (totalmeter * totalmeter);
                          var popup = "";
                          if (bmi > 25) {
                            popup = "You are overweighted";
                            backcolor = Colors.yellow.shade300;
                          } else if (bmi < 18) {
                            popup = "You are underweighted";
                            backcolor = Colors.red;
                          } else {
                            popup = "You are healthy";
                            backcolor = Colors.green.shade300;
                          }

                          setState(() {
                            result =
                                "$popup \n Your BMI is ${bmi.toStringAsFixed(5)}";
                          });
                        } else {
                          setState(() {
                            result =
                                "Please fill all the required informations";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(height: 18),
                  Text(result, style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
          ),
        ));
  }
}
