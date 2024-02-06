import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  String result = "";
  double height = 0;
  double weight = 0;
  int currentIndex = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  radioButton("Female", Colors.pink, 0),
                  SizedBox(
                    width: 10,
                  ),
                  radioButton("Male", Colors.blue, 1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your height",
                  labelText: "Height",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: InputDecoration(
                  hintText: "Enter your weight",
                  labelText: "Weight",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.text);
                      weight = double.parse(weightController.text);
                    });
                    calculateBMI(height, weight);
                  },
                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Result is : $result ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget radioButton(String gender, Color color, int index) {
    return Expanded(
        child: Container(
      height: 80,
      child: MaterialButton(
        onPressed: () {
          changeIndex(index);
        },
        color: currentIndex == index ? color : Colors.grey[300],
        child: Text(
          gender,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    ));
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  void calculateBMI(double height, double weight) {
    double finalResult = weight / (height * height / 10000);
    String bmiResult = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmiResult;
    });
  }
}
