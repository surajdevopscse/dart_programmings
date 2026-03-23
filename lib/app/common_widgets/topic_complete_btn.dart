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
      final state = progressService.getProgress(routePath);
      final isDone = state == ProgressState.completed;
      final isInProgress = state == ProgressState.inProgress;

      final bgColor = isDone
          ? Colors.green.shade50
          : isInProgress
              ? Colors.blue.shade50
              : Colors.grey.shade100;
      final borderColor = isDone
          ? Colors.green
          : isInProgress
              ? Colors.blue.shade300
              : Colors.grey.shade300;
      final iconColor =
          isDone ? Colors.green : isInProgress ? Colors.blue : Colors.grey;
      final textColor = isDone
          ? Colors.green.shade700
          : isInProgress
              ? Colors.blue.shade700
              : Colors.grey.shade700;
      final iconData =
          isDone ? Icons.check_circle : Icons.radio_button_unchecked;
      final label = isDone ? 'Completed ✓' : 'Mark as Complete';

      return GestureDetector(
        onTap: () => progressService.toggleComplete(routePath),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Text(label,
                  style: TextStyle(
                      color: textColor, fontWeight: FontWeight.w600)),
              if (isInProgress) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'In Progress',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
