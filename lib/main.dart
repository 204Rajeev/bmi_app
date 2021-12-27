import 'package:flutter/material.dart';

import 'secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  double _result = 0;
  String status = 'not calculated';
  String url = 'nothing';

  //var body;
  void calculate(double height, double weight, int gender) {
    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    if (_result > 25 && _result < 30 && gender == 1) {
      status = 'Overweight';
      url = 'assets/images/overwight-man.jpg';
    } else if (_result <= 18.5 && gender == 1) {
      status = 'UnderWeight';
      url = 'assets/images/under-weight-man.jpg';
    } else if (_result >= 18.5 && _result <= 24.9 && gender == 1) {
      status = 'NormalWeight';
      url = 'assets/images/normal-weight-man.jpg';
    } else if (_result > 30 && gender == 1) {
      status = 'OBESE';
      url = 'assets/images/obese-man_.jpg';
    } else if (_result > 25 && _result < 30 && gender == 0) {
      status = 'Overweight';
      url = 'assets/images/over-weight-women.jpg';
    } else if (_result <= 18.5 && gender == 0) {
      status = 'UnderWeight';
      url = 'assets/images/under-weight-women.jpg';
    } else if (_result >= 18.5 && _result <= 24.9 && gender == 0) {
      status = 'NormalWeight';
      url = 'assets/images/normal-weight-women.jpg';
    } else if (_result > 30 && gender == 0) {
      status = 'OBESE';
      url = 'assets/images/obese-women.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    int gender = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter height in meter',
                    icon: Icon(Icons.linear_scale),
                  )),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter weight in kg',
                  icon: Icon(Icons.line_weight),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple[400],
                    textColor: Colors.white,
                    onPressed: () {
                      gender = 1;
                    },
                    child: Text('MALE'),
                  ),
                  RaisedButton(
                    color: Colors.purple[400],
                    textColor: Colors.white,
                    onPressed: () {
                      gender = 0;
                      color:
                      Colors.pink[400];
                    },
                    child: Text('FEMALE'),
                  ),
                ]),

            SizedBox(height: 90),
            RaisedButton(
              padding: EdgeInsets.all(30),
              color: Colors.purple[400],
              textColor: Colors.white,
              onPressed: () {
                setState(() {});
                calculate(double.parse(heightController.text),
                    double.parse(weightController.text), gender);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Secondpage(
                            result: _result,
                            status: status,
                            url: url,
                          )),
                );
              },
              child: Text('CALCULATE'),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
