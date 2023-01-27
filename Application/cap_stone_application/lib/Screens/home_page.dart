import 'package:cap_stone_application/Screens/DataVisualization/chart_table.dart';
import 'package:cap_stone_application/Widgets/group_names.dart';
import 'package:cap_stone_application/Widgets/group_number.dart';
import 'package:flutter/material.dart';

import 'DataVisualization/v1_graph.dart';
import 'DataVisualization/v2_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Cap Application'),
        centerTitle: true,
      ),
      drawer: Drawer(
        // backgroundColor: const Color(0xFFDBE4EE),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Methane IoT App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              leading: const Icon(
                Icons.table_chart,
              ),
              title: const Text('Table'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ChartTable();
                }));
              },
            ),
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              leading: const Icon(
                Icons.auto_graph,
              ),
              title: const Text('Methane Graph'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MathaneGraph();
                }));
              },
            ),
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              leading: const Icon(
                Icons.auto_graph,
              ),
              title: const Text('Temperature Graph'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TempGraph();
                }));
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          groupNumber(Icons.home, '25313'),
          const SizedBox(
            height: 40.0,
          ),
          const Text(
            'Group Members',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 40.0,
          ),
          groupNames("Mohamed Khaled El-Shabasy", "Mohamed Ahmed Zakaria", "Kamal Hany Kamal")
        ],
      ),
    );
  }
}
