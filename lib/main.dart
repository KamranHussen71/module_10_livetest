import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelectionListScreen(),
    );
  }
}

class SelectionListScreen extends StatefulWidget {
  const SelectionListScreen({super.key});

  @override
  _SelectionListScreenState createState() => _SelectionListScreenState();
}

class _SelectionListScreenState extends State<SelectionListScreen> {
  List<Item> items = List.generate(5, (index) => Item("Item ${index + 1}", false));

  List<Item> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              setState(() {
                item.selected = !item.selected;
                if (item.selected) {
                  selectedItems.add(item);
                } else {
                  selectedItems.remove(item);
                }
              });
            },
            tileColor: item.selected ? Colors.blue : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Selected Items'),
                content: Text('Number of selected items: ${selectedItems.length}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class Item {
  final String name;
  bool selected;

  Item(this.name, this.selected);
}
