import 'package:flutter/material.dart';
import 'package:mod10_assignment/list_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> itemList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_rounded),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Add Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Add Description'),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  addItemToList();
                },
                child: const Text('Add'),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListItem(
                        item: itemList[index],
                        updateItemCallback: (updatedItem) {
                          updateItemInList(index, updatedItem);
                        },
                        onDelete: () {
                          deleteItemFromList(index);
                        },
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addItemToList() {
    // Check if both title and description are not empty
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty) {
      setState(() {
        itemList.add({
          'title': titleController.text,
          'description': descriptionController.text,
        });

        // Clear text fields after adding to the list
        titleController.clear();
        descriptionController.clear();
      });
    } else {
      // Show an alert or a message indicating that both fields are required
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Both title and description are required."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void updateItemInList(int index, Map<String, dynamic> updatedItem) {
    setState(() {
      itemList[index] = updatedItem;
    });
  }

  void deleteItemFromList(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }
}
