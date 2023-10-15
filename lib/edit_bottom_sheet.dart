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
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Edit Title'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Edit Description'),
                ),
                SizedBox(height: 16),
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
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
