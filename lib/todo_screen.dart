

import 'package:flutter/material.dart';
import 'package:rxdart_bloc/bloc/get_todos_bloc.dart';
import 'package:rxdart_bloc/model/todo.dart';
import 'package:rxdart_bloc/model/todos_response.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todobloc.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: todobloc.subject.stream,
        builder: (context, AsyncSnapshot<TodosResponse> snapShot){

      if(snapShot.hasData){

        if(snapShot.data.error!=null && snapShot.data.error.length >0){
          return _buildErrorWidget(snapShot.data.error);

        }
        return Container(
          height: MediaQuery.of(context).size.height,
          child: _buildHomeWidget(snapShot.data,context),
        );
      }else if(snapShot.hasError){

        return _buildErrorWidget(snapShot.data.error);
      }else{

        return _buildLoadingWidget();

      }

    });



    }

    Widget _buildHomeWidget(TodosResponse data ,var context){

    List<Todos> todolist = data.todos;

    if(todolist.length == 0){
      return Container(width: MediaQuery.of(context).size.width,child: Column(children: <Widget>[
        Text("NO More Todos .. ")

      ],),);

    }else{

      return Container(child: ListView.builder(scrollDirection : Axis.vertical,shrinkWrap: true , itemCount: todolist.length,itemBuilder: (context , indext){

        return Container(child: Text(todolist[indext].title), margin: EdgeInsets.all(10),);

      }),);

    }

    }


    Widget _buildErrorWidget(String error){

    return Center(child: Column(children: <Widget>[

      Text("Error ...")

    ],),);
    }


    Widget _buildLoadingWidget(){

    return Center(child: SizedBox(height: 25, width: 25,child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),strokeWidth: 1,),),);

    }
}
