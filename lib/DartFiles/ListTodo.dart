import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  final String listText;
  final bool completed;
  final void Function(bool?)? onChanged;

  const Todolist({
    super.key,
    required this.listText,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 249, 249),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: completed,
              onChanged: onChanged,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                listText,
                style: TextStyle(
                  fontSize: 16,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
