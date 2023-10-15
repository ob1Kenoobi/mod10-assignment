import 'package:flutter/material.dart';

void showEditBottomSheet(BuildContext context, Map<String, dynamic> item,
    Function(Map<String, dynamic>) updateItemCallback) {
  TextEditingController titleController =
      TextEditingController(text: item['title']);
  TextEditingController descriptionController =
      TextEditingController(text: item['description']);

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Edit Title'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Edit Description'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Update the item with the new values
                    Map<String, dynamic> updatedItem = {
                      'title': titleController.text,
                      'description': descriptionController.text,
                    };
                    updateItemCallback(updatedItem);

                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
