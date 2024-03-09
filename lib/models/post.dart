import 'package:flutter/material.dart';
import 'package:sekawan_mobile/models/user.dart';

class Post {

  int? id= 0;
  int? userId= 0;
  String? userImage= '';
  String? body= '';
  int? like= 0;
  int? comment= 0;
  bool? liked;
  List<Comment> comments= [];
  User user= User();

  String? error;

  void setData(Map<String, dynamic> data) {
    id= data['id'];
    userId= data['user_id'] ?? data['userId'];
    body= data['body'];
  }

  void getComments(List<Comment> data) {
    debugPrint('comment data: ${data[0].body.toString()}');
    for(int i=0; i< data.length; i++) {
      debugPrint('adding comment ${data[i].body} on data[$i]');
      if(data[i].postId== id) {
        debugPrint('comment on id= $id');
        comments.add(data[i]);
      }
    }
  }

  void likePost() {
    like= like==1? 0 : 1;
    liked= !(liked??false);
  }

  void getUser(List<User> data) {
    for(int i=0; i< data.length; i++) {
      if(data[i].id== userId) {
        debugPrint('adding user ${data[i].id} on id= $userId');
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

  int id= 0;
  int postId= 0;
  String name= 'no-name';
  String email= 'no-email';
  String body= 'no-body';

  String? error;

  void setData(Map<String, dynamic>? data) {
    if(data!= null) {
      id= data['id'];
      postId= data['postId'];
      name= data['name'];
      email= data['email'];
      body= data['body'];
    }
  }

  void setError(String error) {
    this.error= error;
  }
}