// list_item.dart

import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> item;

  ListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    // Define a color for the list item based on its index
    Color itemColor =
        Colors.blue; // You can change this color to your preference

    return Container(
      color: itemColor,
      child: ListTile(
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
      ),
    );
  }
}
