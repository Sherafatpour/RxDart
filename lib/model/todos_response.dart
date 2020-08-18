import 'dart:convert';

import 'package:rxdart_bloc/model/todo.dart';

import 'todo.dart';

class TodosResponse{


  final List<Todos> todos;
  final String error;

  TodosResponse(this.todos, this.error);

  TodosResponse.fromJson(List<dynamic> json):
  todos = json.map((e) => new Todos.fromJson(e)).toList(), error = "";


  TodosResponse.withError(String errorValue):

    todos = List(),error = errorValue;


}