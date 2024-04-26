import 'package:flutter/material.dart';
import 'dart:math'; //package for generating random numbers.

//enum to represent randomTasks
enum Tasks {
  bookreading,
  journaling,
  recipecooking,
  housecleaning,
  exercise,
  meditation,
  naturewalk,
  languagelearning,
  workspaceorganisation,
  friendcalling,
  documentarywatching,
  gardening,
  goalplanning,
  musiclistening,
  creativity,
  volunteering,
  learning,
  research,
  budgeting,
  hobbypracticing,
}

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late String randomTask = Tasks.bookreading
      .toString()
      .split('.')
      .last; //We declare the randomTask variable at the class level because we want it to be accessible across different methods within the _HelpPageState class and also to store the randomly generated task.The late keyword is used here because randomTask is initialized after the class is instantiated. By marking it as late, we're telling Dart that the variable will be assigned a value before it's used.

//Method to generate a random task from the Tasks enum
  String generateRandomTask() {
    final random = Random(); //creating a new Random object
    final List<Tasks> values = Tasks.values; //Getting a list of all enum values
    final randomTask =
        values[random.nextInt(values.length)]; //Picking a random value
    return randomTask
        .toString()
        .split('.')
        .last; //Return the task name as a String and initialize with the first task. Remember printing the enums we get the output as Tasks.bookreading hence we want the last part bookreading.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Help Screen',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          centerTitle: true,
          actions: [
            Container(
              //added a container to be able to adjust the size of the icon
              width: 80.0,
              height: 100.0,
              child: Icon(Icons.lightbulb_sharp,
                  color: Colors.yellow[800],
                  size: 36.0,
                  semanticLabel: 'ideas'),
            ),
          ],
          leading: Container(
            width: 200.0,
            height: 100.0,
            child: IconButton(
                icon: Icon(Icons.arrow_circle_left_rounded),
                onPressed: () {
                  Navigator.pop(context); //Navigate back when pressed
                }),
          ),
          backgroundColor: Color.fromARGB(255, 136, 48, 7),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Embark on a Journey of Discovery with Random Tasks!',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 211, 120, 2))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text(randomTask, //Display the current random task
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                randomTask = generateRandomTask(); //Generate a new random task
              }),
              child: Text('Next'),
            )
          ]),
        ));
  }
}
