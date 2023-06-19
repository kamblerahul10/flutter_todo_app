import 'package:flutter/material.dart';
import 'package:to_do_list/colors.dart';
import 'package:to_do_list/todo.dart';
import 'package:to_do_list/todoList.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: tdBgColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.black, size: 40,),
              Icon(Icons.person_outline_outlined, color: Colors.black, size: 40,)
            ],
          )
      ),
      body: Stack(
        children: [
          Container(
            color: tdBgColor,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                Container(
                  //margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: TextField(
                    onChanged: (value) => runFliter(value),
                    controller: _todoController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.black,size: 20),
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        for(ToDo todo in _foundToDo)
                          todoList(
                            todo: todo,
                            onToDoChange: _handleToDoChange,
                            onDeleteItem: onDeleteToDoItem,
                          ),

                      ],
                    ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        bottom: 20, right: 20,left: 20
                    ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0,0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Add a new todo Item',
                  border: InputBorder.none
                ),
              ),
              )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right: 20),
                child: ElevatedButton(
                  onPressed: (){
                    addToDoItem(_todoController.text);
                  },
                  child: Text('+',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ],)
          )
        ],
      ),
    );
  }


  void _handleToDoChange(ToDo todo){

    setState(() {
      todo.isDone = !todo.isDone;
    });

  }

  void addToDoItem(String toDo){
    setState(() {
      todosList.add(
          ToDo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              textName: toDo,
          ));
    });

    _todoController.clear();

  }

  void runFliter(String enteredKey){
    List<ToDo> results = [];
    if(enteredKey == null ){
      results = todosList;
    }else{
      results = todosList
          .where((item)=> item.textName!
          .toLowerCase()
          .contains(enteredKey.toLowerCase()))
          .toList();

    }

    setState(() {
      _foundToDo = results;
    });

  }

  void onDeleteToDoItem(String id){

    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });

  }

}




