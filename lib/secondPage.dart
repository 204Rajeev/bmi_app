import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  double result;
  String status;
  String url;
  Secondpage(
      {Key? key, required this.result, required this.status, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text("RESULTS"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          //controller: controller,
          child: Column(
            children: [
              SizedBox(height: 25),
              // ignore: prefer_const_constructors
              Text(
                "YOUR BMI IS : ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                (result == 0.0)
                    ? "Enter Value"
                    : "${result.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                status,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 20),
              Image.asset(url),
              SizedBox(height: 20),
              Image.asset('assets/images/scale_1.jpg'),
              //SizedBox(height: 20),
              RaisedButton(
                color: Colors.purple[400],
                textColor: Colors.white,
                //print(result.toStringAsFixed(2)),
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text("BACK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
