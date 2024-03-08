import 'package:flutter/material.dart';
import 'package:sekawan_mobile/models/post.dart';

class PostWidget extends StatefulWidget {
  final Post data;
  const PostWidget({super.key, required this.data});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        
    );
  }
}