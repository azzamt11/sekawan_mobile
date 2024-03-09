import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/user.dart';
import '../services/api_client.dart';

class DataRepository {

  Future<List<Post>> getPosts() async {
    List<Post> posts= await ApiClient().getPosts();
    List<User> users= await ApiClient().getUsers();

    for(int i=0; i< posts.length; i++) {
      //posts[i].getComments(comments);
      posts[i].getUser(users);
    }

    debugPrint('step 0: posts= ${posts[0].body.toString()}');

    return posts;
    
  }

  Future<List<Comment>> getComments(int postId) async {
    List<Comment> comments= await ApiClient().getComments();
    List<Comment> data= [];
    for(int i=0; i< comments.length; i++) {
      debugPrint('debug at data_repo: id= $postId, comments[i].postId= ${comments[i].postId}, comments[i].body= ${comments[i].body}');
      if(comments[i].postId== postId) {
        debugPrint('so it is true');
        data.add(comments[i]);
      } else {
        debugPrint('so... it is false');
      }
    }

    return data;
  }
}