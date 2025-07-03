import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Reusable-Widgets/custom-Drawer.dart';

import '../Reusable-Widgets/Bottom-Sheet.dart';
import '../Reusable-Widgets/custom-AppBar.dart';
import '../Utils/User-Preference-Data.dart';

class Dashboardpage extends StatefulWidget {
  Dashboardpage({super.key,required this.callId});

  final String callId;

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {

  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  void getName() async{
    String? fetchedName = await UserPreferencesData.getName();
    setState(() {
      name = fetchedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {},
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 50),

                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name ?? 'User',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Calley Personal',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Icon(Icons.call, color: Colors.green),
                ),

                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {

                      bottomSheet(context);

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Start Calling Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
