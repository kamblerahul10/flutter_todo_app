import 'package:flutter/material.dart';
import 'package:to_do_list/todo.dart';

class todoList extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;

  const todoList({Key? key, required this.todo, required this.onToDoChange, required this.onDeleteItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: ListTile(
        onTap: (){
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank
          ,color: Colors.black,
        ),
        title: Text(
          todo.textName!,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            alignment: Alignment.center,
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          )
        ),
      ),
    );
  }
}
