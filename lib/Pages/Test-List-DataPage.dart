import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Reusable-Widgets/custom-Drawer.dart';

import '../Reusable-Widgets/custom-AppBar.dart';

class Testlistdatapage extends StatelessWidget {
  Testlistdatapage({
    super.key,
    required this.data
  });

  final Map<String, dynamic> data;


  @override
  Widget build(BuildContext context) {

    int pendingCalls = data['pending'];
    int doneCalls = data['called'];
    int scheduleCalls = data['rescheduled'];
    int totalCalls = pendingCalls + doneCalls + scheduleCalls;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Test List'),
                      Row(
                        children: [
                          Text(
                            totalCalls.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text('Calls'),
                        ],
                      ),
                    ],
                  ),

                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'S',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: Colors.orange,
                      value: pendingCalls.toDouble(),
                      radius: 55,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: doneCalls.toDouble(),
                      radius: 50,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: Colors.blue,
                      value: scheduleCalls.toDouble(),
                      radius: 50,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardData('Pending',Colors.orange.withOpacity(0.2),data['pending']),
                _cardData('Done',Colors.green.withOpacity(0.2),data['called']),
                _cardData('Schedule',Colors.blue.withOpacity(0.2),data['rescheduled'])
              ],
            ),

            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                child: Center(
                  child: Text(
                    'Start Calling Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _cardData(String title,Color color,int value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 40,
              decoration: BoxDecoration(
                color: color.withBlue(1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(width: 10),
            Column(
              children: [
                Text(title),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('Calls'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
