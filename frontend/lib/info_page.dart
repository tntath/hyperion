import 'package:flutter/material.dart';
import 'package:nasa/widgets/add_activity.dart';
import 'package:nasa/widgets/chart.dart';
import 'package:nasa/widgets/indicator.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const AddActivity(),
        ),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIndicator(
                percentage: 40,
                title: "Air Quality",
                colors: [
                  Color.fromARGB(255, 31, 250, 126),
                  Color.fromARGB(255, 136, 215, 255)
                ],
              ),
              CustomIndicator(
                percentage: 40,
                title: "Water Quality",
                colors: [
                  Color.fromARGB(255, 0, 94, 255),
                  Color.fromARGB(255, 122, 205, 247)
                ],
              ),
            ],
          ),
          ChartShow(),
        ],
      ),
    );
  }
}
