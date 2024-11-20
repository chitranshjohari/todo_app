import 'package:flutter/material.dart';

class Dialoge extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onsave;
  final VoidCallback oncancle;

  const Dialoge({
    super.key,
    required this.controller,
    required this.onsave,
    required this.oncancle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.blueGrey[50],
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title Text
            const Text(
              "Add New Task",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: "Enter task name",
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: oncancle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onsave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
