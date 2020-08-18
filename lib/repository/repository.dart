
import 'package:dio/dio.dart';
import 'package:rxdart_bloc/model/todos_response.dart';

class TodoRepository{

  final Dio _dio = Dio();


  Future<TodosResponse> getTodo() async{

    var url = "https://jsonplaceholder.typicode.com/todos";

    try{

      Response response = await _dio.get(url);
     return  TodosResponse.fromJson(response.data);
    }catch(error , stack){

      print("Exeption : $error");
      return  TodosResponse.withError("$error");
    }

  }

}