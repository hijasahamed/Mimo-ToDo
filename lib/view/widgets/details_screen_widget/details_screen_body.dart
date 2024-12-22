import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mimo_flutter_app/view/widgets/details_screen_widget/build_task_section.dart';
import 'package:mimo_flutter_app/view/widgets/details_screen_widget/categorize_task.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({
    super.key,
    required this.docId,
    required this.screenSize,
  });

  final String docId;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
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
        final taskMap = categorizeTasks(tasks);
    
        return ListView(
          padding: const EdgeInsets.all(20),
          children: taskMap.entries.map((entry) {
            final date = entry.key;
            final tasks = entry.value;
            return buildTaskSection(date, tasks,screenSize);
          }).toList(),
        );
      },
    );
  }
}