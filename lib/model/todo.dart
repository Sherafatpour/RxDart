class Todos{

  final int id , userId;
  final String title;


  Todos(this.id, this.userId, this.title);



  Todos.fromJson(Map<String , dynamic> json):

      id = json['id'],
      userId = json['userId'],
      title = json['title'];

}