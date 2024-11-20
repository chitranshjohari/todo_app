import 'package:flutter/material.dart';
import 'package:todo_app/DartFiles/Dialoge.dart';
import 'package:todo_app/DartFiles/ListTodo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = TextEditingController();
  List toDoList = [
    [
      "To add task click on the button given below and to delete the task slide left or right",
      false
    ],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void savelist() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        toDoList.add([controller.text.trim(), false]);
      });
      controller.clear();
    }
    Navigator.of(context).pop();
  }

  void addtodo() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialoge(
          controller: controller,
          onsave: savelist,
          oncancle: () {
            controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deleteItem(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          "To Do List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.deepPurple[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addtodo,
        backgroundColor: Colors.orange[600],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: toDoList.isEmpty
            ? Center(
                child: Text(
                  "No tasks added yet!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(toDoList[index][0]),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      deleteItem(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("${toDoList[index][0]} deleted")),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple[200]!,
                            Colors.blue[300]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Todolist(
                        listText: toDoList[index][0],
                        completed: toDoList[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
