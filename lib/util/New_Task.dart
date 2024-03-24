import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

// ignore: must_be_immutable, camel_case_types
class New_Task extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  // VoidCallback onChanged;
  VoidCallback onCancel;

  New_Task({
    super.key,
    required this.controller,
    required this.onSave,
    // required this.onChanged,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade200,
      content: Container(
        height: 150,
        child: Column(children: [
          TextField(
            // onChanged: (String val),
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 8),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
