import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mimo_flutter_app/controller/details_screen_controller.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.screenSize,required this.docId,required this.title});
  final Size screenSize;
  final String title;
  final String docId;
  @override
  Widget build(BuildContext context) {
    DetailsScreenController detailsScreenController = Get.put(DetailsScreenController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 36, 47),
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: MimoTextWidget(text: title,  color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc(docId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No tasks available.',style: TextStyle(color: Colors.white),));
          }

          // Fetch the tasks array
          final tasks = (snapshot.data!.data() as Map<String, dynamic>)['task'] as List<dynamic>?;

          if (tasks == null || tasks.isEmpty) {
            return const Center(child: Text('No tasks available.',style: TextStyle(color: Colors.white),));
          }

          // Parse and categorize tasks
          final now = DateTime.now();
          final taskMap = _categorizeTasks(tasks, now);

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              if (taskMap['Today'] != null) _buildTaskSection('Today', taskMap['Today']!),
              if (taskMap['Tomorrow'] != null) _buildTaskSection('Tomorrow', taskMap['Tomorrow']!),
              if (taskMap['Upcoming'] != null) _buildTaskSection('Upcoming', taskMap['Upcoming']!),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () {
          Get.dialog(
            AlertDialog(
              backgroundColor: const Color.fromARGB(255, 28, 36, 47),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: detailsScreenController.taskController,
                    decoration: InputDecoration(
                      hintText: 'Type your task...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: screenSize.width / 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width / 20,
                    ),
                  ),

                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    detailsScreenController.taskController.clear();
                    Get.back();
                  },
                  child: const Text("Back",style: TextStyle(color: Colors.white),),
                ),
                TextButton(
                  onPressed: () async {
                    final taskName = detailsScreenController.taskController.text.trim();
                    detailsScreenController.taskController.clear();
                    if (taskName.isNotEmpty) {
                      detailsScreenController.addTaskToCategory(docId, taskName);
                      Get.back();
                    } else {
                      Get.snackbar("Error", "Task name cannot be empty",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    }
                  },
                  child: const Text("Add",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          );
        },
        child: Center(
          child: Icon(Icons.add,size: screenSize.width/13,color: Colors.blue,),
        ),
      )
    );
  }

  /// Categorize tasks based on date
  Map<String, List<Map<String, String>>> _categorizeTasks(List<dynamic> tasks, DateTime now) {
    final taskMap = {
      'Today': <Map<String, String>>[],
      'Tomorrow': <Map<String, String>>[],
      'Upcoming': <Map<String, String>>[],
    };

    for (var task in tasks) {
      final taskName = task['name'] ?? 'No Name';
      final taskTime = task['time'] ?? 'No Time';

      try {
        final taskDateTime = DateFormat('dd/MM/yyyy HH:mm').parse(taskTime);
        final taskDate = DateTime(taskDateTime.year, taskDateTime.month, taskDateTime.day);

        if (taskDate == DateTime(now.year, now.month, now.day)) {
          taskMap['Today']!.add({'name': taskName, 'time': taskTime});
        } else if (taskDate == DateTime(now.year, now.month, now.day + 1)) {
          taskMap['Tomorrow']!.add({'name': taskName, 'time': taskTime});
        } else if (taskDate.isAfter(now)) {
          taskMap['Upcoming']!.add({'name': taskName, 'time': taskTime});
        }
      } catch (e) {
        
      }
    }

    // Sort tasks within each category by time
    taskMap.forEach((key, value) {
      value.sort((a, b) => a['time']!.compareTo(b['time']!));
    });

    return taskMap;
  }

  /// Build a section for tasks
  Widget _buildTaskSection(String title, List<Map<String, String>> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [             
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            
            return Container(
              margin: EdgeInsets.only(bottom: screenSize.width/35,top: screenSize.width/35),
              child: Row(
                children: [
                  title=='Today'? CircleAvatar(
                    radius: screenSize.width/35,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check,color: Colors.white,size: screenSize.width/25,),
                  ) : Container(
                    height: screenSize.width/16,
                    width: screenSize.width/16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: .9,color: Colors.green)
                    ),
                    child: Center(child: Icon(Icons.check,color: Colors.white,size: screenSize.width/25,),),
                  ),
                  SizedBox(width: screenSize.width/25,),
                  Text(
                    task['name']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}