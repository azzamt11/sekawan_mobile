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
      body: PopScope(
        onPopInvoked: popFunction,
        child: getBody(size)
      )
    );
  }

  Widget getBody(var size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black12,
      child: Column(
        children: [
          getHeader(size),
          SizedBox(
            height: size.height- 90,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getPosts(size),
              )
            )
          )
        ],
      )
    );
  }

  Widget getHeader(size) {
    return Container(
      height: 40,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Posts', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          ),
          InkWell(
            onTap: () {
              //do nothing
            },
            child: const SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.more_horiz, size: 20,
              )
            )
          )
        ],
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

  void popFunction(bool param) {
    //do nothing
  }
}