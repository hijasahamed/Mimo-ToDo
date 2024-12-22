import 'package:flutter/material.dart';

/// Build sections for each date dynamically
  Widget buildTaskSection(String date, List<Map<String, String>> tasks,Size screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            date,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              margin: EdgeInsets.only(bottom: screenSize.width / 35, top: screenSize.width / 35),
              child: Row(
                children: [
                  date =='Today'? CircleAvatar(
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
                  SizedBox(width: screenSize.width / 25),
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