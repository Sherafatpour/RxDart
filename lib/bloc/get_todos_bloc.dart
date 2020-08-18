import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_bloc/model/todos_response.dart';
import 'package:rxdart_bloc/repository/repository.dart';

class TodosBloc{


  final TodoRepository _repository = TodoRepository();

  final BehaviorSubject<TodosResponse> _subject =
      BehaviorSubject<TodosResponse>();


  getTodos() async{

    TodosResponse response = await _repository.getTodo();

    _subject.sink.add(response);

  }

  void drainStrim(){
    _subject.value = null;

  }


  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }


  BehaviorSubject<TodosResponse> get subject => _subject;

}

final todobloc = TodosBloc();