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
        title: Text('Flutter List App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
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
              decoration: InputDecoration(labelText: 'Add Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  addItemToList();
                },
                child: Text('Add to List'),
              ),
            ),
            SizedBox(height: 16),
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
                      Divider(),
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
    setState(() {
      itemList.add({
        'title': titleController.text,
        'description': descriptionController.text,
      });

      // Clear text fields after adding to the list
      titleController.clear();
      descriptionController.clear();
    });
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
