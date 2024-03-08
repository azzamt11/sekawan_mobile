import 'package:sekawan_mobile/models/user.dart';

class Post {

  int? id;
  int? userId;
  String? userImage;
  String? body;
  int? like;
  int? comment;
  List<Comment> comments= [];
  User user= User();

  String? error;

  void setData(Map<String, dynamic> data) {
    id= data['id'];
    userId= data['user_id'];
    body= data['body'];
  }

  void getComments(List<Comment> data) {
    for(int i=0; i< data.length; i++) {
      if(data[i].postId== id) {
        comments.add(data[i]);
      }
    }
  }

  void getUser(List<User> data) {
    for(int i=0; i< data.length; i++) {
      if(data[i].id== userId) {
        user= data[i];
        break;
      }
    }
  }

  void setError(String error) {
    this.error= error;
  }

}

class Comment {

  int? id;
  int? postId;
  String? name;
  String? email;
  String? body;

  void setData(Map<String, dynamic> data) {
    id= data['id'];
    postId= data['post_id'];
    name= data['name'];
    email= data['email'];
    body= data['body'];
  }
}