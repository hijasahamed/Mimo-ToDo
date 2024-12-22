import 'package:intl/intl.dart';

/// Categorize tasks based on specific dates with custom labels
  Map<String, List<Map<String, String>>> categorizeTasks(List<dynamic> tasks) {
    final Map<String, List<Map<String, String>>> taskMap = {};

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day); // Normalize to today's date
    final tomorrow = today.add(const Duration(days: 1));

    for (var task in tasks) {
      final taskName = task['name'] ?? 'No Name';
      final taskTime = task['time'] ?? 'No Time';

      try {
        // Parse the task date
        final taskDateTime = DateFormat('dd/MM/yyyy').parse(taskTime.split(' ')[0]);
        final taskDate = DateTime(taskDateTime.year, taskDateTime.month, taskDateTime.day);

        // Compare the task date with today, tomorrow, etc.
        String formattedDate;
        if (taskDate.isAtSameMomentAs(today)) {
          formattedDate = 'Today';
        } else if (taskDate.isAtSameMomentAs(tomorrow)) {
          formattedDate = 'Tomorrow';
        } else {
          formattedDate = DateFormat('dd MMM yyyy').format(taskDate); // Example: 22 Dec 2024
        }

        // Add task to the respective date category
        if (!taskMap.containsKey(formattedDate)) {
          taskMap[formattedDate] = [];
        }
        taskMap[formattedDate]!.add({'name': taskName, 'time': taskTime});
      } catch (e) {
        // Handle invalid date format gracefully
      }
    }

    // Sort tasks within each category by time
    taskMap.forEach((key, value) {
      value.sort((a, b) => a['time']!.compareTo(b['time']!));
    });

    return taskMap;
  }