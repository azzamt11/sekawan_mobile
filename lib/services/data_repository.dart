import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/user.dart';
import '../services/api_client.dart';

class DataRepository {

  Future<List<Post>> getPosts() async {
    List<Post> posts= await ApiClient().getPosts();
    List<Comment> comments= await ApiClient().getComments();
    debugPrint('at data_repo comments[0].body= ${comments[0].body}');
    List<User> users= await ApiClient().getUsers();

    for(int i=0; i< posts.length; i++) {
      //posts[i].getComments(comments);
      posts[i].getUser(users);
    }

    debugPrint('step 0: posts= ${posts[0].body.toString()}');

    return posts;
    
  }
}