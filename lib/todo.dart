import 'package:flutter/material.dart';

class ToDo{
  String? id;
  String? textName;
  late bool isDone;

  ToDo({
    required this.id,
    required this.textName,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      //ToDo(id: '01', textName: 'Wakeup ', isDone: true),
      //ToDo(id: '02', textName: 'Exercise ', isDone: true),
      //ToDo(id: '03', textName: 'Breakfast '),
      //ToDo(id: '04', textName: 'Book Reading '),
      //ToDo(id: '05', textName: 'Team Meeting'),

    ];
  }
}