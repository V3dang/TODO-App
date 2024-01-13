import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class New_Task extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  New_Task({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade200,
      content: Container(
        height: 100,
        child: Column(
          children:[ TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save",
                    onPressed: onSave),

                const SizedBox(width: 8),

                MyButton(text: "Cancel",
                    onPressed: onCancel),
              ],
            )

        ]),
      ),
    );
  }
}

