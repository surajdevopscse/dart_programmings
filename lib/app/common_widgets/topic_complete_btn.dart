import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicCompleteBtn extends StatelessWidget {
  final String routePath;
  const TopicCompleteBtn({super.key, required this.routePath});

  @override
  Widget build(BuildContext context) {
    final progressService = Get.find<ProgressService>();
    return GetBuilder<ProgressService>(builder: (_) {
      final done = progressService.isCompleted(routePath);
      return GestureDetector(
        onTap: () => progressService.toggleComplete(routePath),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: done ? Colors.green.shade50 : Colors.grey.shade100,
            border: Border.all(color: done ? Colors.green : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(done ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: done ? Colors.green : Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(done ? 'Completed ✓' : 'Mark as Complete',
                  style: TextStyle(
                      color: done ? Colors.green.shade700 : Colors.grey.shade700,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
    });
  }
}
