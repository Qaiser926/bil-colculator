import 'dart:math';

import 'package:flutter/material.dart';

class BillColculator extends StatefulWidget {
  const BillColculator({Key? key}) : super(key: key);

  @override
  State<BillColculator> createState() => _BillColculatorState();
}

int totalBill = 0;
int n = 1;
double tip = 0.0;

class _BillColculatorState extends State<BillColculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.pinkAccent,
                      width: 5,
                      style: BorderStyle.solid)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Bill Calculator Per Head',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    '${(((totalBill * tip) / 100) + totalBill) / n} Rs',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.pinkAccent,
                      width: 5,
                      style: BorderStyle.solid)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            totalBill = int.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'please enter your amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Split By',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (n > 1) n--;
                                });
                              },
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '$n',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    n++;
                                  });
                                },
                                icon: Icon(Icons.arrow_forward_ios_outlined)),
                          )
                        ],
                      ),
                      Text(
                        'Tip is ${tip.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
