import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Reusable-Widgets/custom-Drawer.dart';

import '../Reusable-Widgets/custom-AppBar.dart';

class Testlistdatapage extends StatelessWidget {
  const Testlistdatapage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            '09',
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
                      color: Colors.blue,
                      value: 30,
                      radius: 55,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 30,
                      radius: 50,
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 20,
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
              children: [_cardData(), _cardData(), _cardData()],
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

            // Center(
            //   child: ElevatedButton(onPressed: (){
            //     ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            //     );
            //   }, child: Text('Start Calling Now')),
            // )
          ],
        ),
      ),
    );
  }

  Widget _cardData() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(width: 10),
            Column(
              children: [
                Text('Pending'),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '09',
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
