import 'package:flutter/material.dart';

class myCalculator extends StatefulWidget {
  @override
  State<myCalculator> createState() => _myCalculatorState();
}

class _myCalculatorState extends State<myCalculator> {
  int n = 1;
  int totalbil = 0;
  double tip = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("photo/cal.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bil Calulator'),
          backgroundColor: Colors.purple.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade400.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Bill Calculator per heaed',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${(((totalbil * tip) / 100) + totalbil) / n}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(':Rs',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade400.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 13, right: 13),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (vlaue) {
                                    setState(() {
                                      totalbil = int.parse(vlaue);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text('Please enter your amount'),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Split By',
                                        style: TextStyle(fontSize: 20)),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (n > 1) {
                                              n--;
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.arrow_back_ios)),
                                    Text(
                                      '$n',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            n++;
                                          });
                                        },
                                        icon: Icon(Icons.arrow_forward_ios)),
                                  ],
                                ),
                                Text('Tip is $tip',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Slider(
                                  activeColor: Colors.black,
                                  inactiveColor: Colors.white,
                                  value: tip,
                                  onChanged: (double d) {
                                    setState(() {
                                      tip = d;
                                    });
                                  },
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
