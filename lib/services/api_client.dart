import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/user.dart';

class ApiClient {

  Future<List<Post>> getPosts() async {
    List<Post> data= [];
    try{
      var response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
          }
      );
      var decodedResponse = json.decode(response.body);
      debugPrint('decodedResponse= ${decodedResponse.toString()}');
      for (int i = 0; i < decodedResponse.length; i++) {
        Post post= Post();
        post.setData(decodedResponse[i]);
        data.add(post);
      }
    } catch (e) {
      Post post= Post();
      post.setError('No Connection');
      data.add(post);
      debugPrint('azzam_debug: ${e.toString()}');
    }
    return data;
  }

  Future<List<Comment>> getComments() async {
    List<Comment> data= [];
    try{
      var response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/comments'),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
          }
      );
      var decodedResponse = json.decode(response.body);
      debugPrint('decodedResponse= ${decodedResponse.toString()}');
      for (int i = 0; i < decodedResponse.length; i++) {
        Comment comment= Comment();
        comment.setData(decodedResponse[i]);
        data.add(comment);
      }
    } catch (e) {
      Comment comment= Comment();
      comment.setError('No Connection');
      data.add(comment);
      debugPrint('azzam_debug: ${e.toString()}');
    }
    return data;
  }

  Future<List<User>> getUsers() async {
    List<User> data= [];
    try{
      var response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
          }
      );
      var decodedResponse = json.decode(response.body);
      debugPrint('decodedResponse= ${decodedResponse.toString()}');
      for (int i = 0; i < decodedResponse.length; i++) {
        User user= User();
        user.setData(decodedResponse[i]);
        data.add(user);
      }
    } catch (e) {
      User user= User();
      user.setError('No Connection');
      data.add(user);
      debugPrint('azzam_debug: ${e.toString()}');
    }
    return data;
  }
}