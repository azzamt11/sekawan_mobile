import 'package:sekawan_mobile/models/post.dart';
import 'package:sekawan_mobile/models/user.dart';

class DataRepository {

  Future<List<Post>> getPosts() async {
    List<Post> posts= await ApiClient().getPosts();
    List<Comment> comments= await ApiClient().getComments();
    List<User> users= await ApiClient().getUsers();

    for(int i=0; i< posts.length; i++) {
      posts[i].getComments(comments);
      posts[i].getUser(users);
    }

    return posts;
    
  }
}