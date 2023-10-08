import 'package:flutter/material.dart';
import 'package:nasa/api/api.pb.dart';
import 'package:nasa/main.dart';

String insertSpaces(String input) {
  if (input.isEmpty) {
    return input;
  }

  // Create a new StringBuffer to build the modified string
  final result = StringBuffer();

  // Add the first character to the result
  result.write(input[0]);

  // Iterate through the rest of the characters
  for (int i = 1; i < input.length; i++) {
    // Check if the current character is an uppercase letter
    if (input[i].toUpperCase() == input[i]) {
      // Insert a space before the uppercase letter
      result.write(' ');
    }

    // Add the current character to the result
    result.write(input[i]);
  }

  // Convert the StringBuffer to a string and return it
  return result.toString();
}

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 200,
          height: 300,
          child: ListView(
            children: ActivityType.values
                .map((e) => ListTile(
                      title: Text(insertSpaces(e.toString())),
                      onTap: () async {
                        Navigator.of(context).pop();
                        await stub.sendActivity(Activity(activityType: e));
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
