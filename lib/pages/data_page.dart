import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sekawan_mobile/providers/state_provider.dart';

import '../components/post_widget.dart';
import '../models/post.dart';
import '../services/data_repository.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(size)
    );
  }

  Widget getBody(var size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getPosts(size),
        )
      )
    );
  }

  List<Widget> getPosts(var size) {
    List<Widget> postsWidget= [];
    int length= context.watch<StateProvider>().data.length;
    for(int i=0; i< length; i++) {
      Post data= context.watch<StateProvider>().data[i];
      bool liked= data.liked ?? false;
      postsWidget.add(
        PostWidget(id: i, postId: data.id??0, liked: liked)
      );
    }
    return postsWidget;
  }
}