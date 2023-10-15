import 'package:flutter/material.dart';
import 'package:mod10_assignment/edit_bottom_sheet.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic>) updateItemCallback;
  final VoidCallback onDelete;

  ListItem({
    required this.item,
    required this.updateItemCallback,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Define a color for the list item based on its index
    Color itemColor =
        Colors.blue; // You can change this color to your preference

    return Container(
      color: itemColor,
      child: ListTile(
        onLongPress: () {
          showOptionsDialog(context);
        },
        leading: CircleAvatar(
          child: Text(item['title'][0]), // Display first letter of the title
        ),
        title: Text(
          item['title'],
          style: TextStyle(
              color: Colors
                  .white), // Set text color to white for better visibility
        ),
        subtitle: Text(
          item['description'],
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            color: Colors.white), // Add a trailing arrow icon
      ),
    );
  }

  void showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Options"),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showEditBottomSheet(context, item, updateItemCallback);
                  },
                  child: Text("Edit"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDelete(); // Call the onDelete callback
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
            Spacer(),
          ],
        );
      },
    );
  }
}
