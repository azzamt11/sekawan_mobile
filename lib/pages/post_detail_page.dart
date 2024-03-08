import 'package:flutter/material.dart';

import '../models/post.dart';

class PostDetailPage extends StatefulWidget {
  final Post data;
  const PostDetailPage({super.key, required this.data});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      )
    );
  }

}