import 'package:flutter/material.dart';

import '../components/post_widget.dart';
import '../models/post.dart';
import '../services/data_repository.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<Post> posts= [];
  
  @override
  void initState() {
    getData();
    super.initState();
  }

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
        child: posts.isNotEmpty? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  getPosts(size),
        ) : getLoader(size)
      )
    );
  }

  Widget getLoader(var size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            backgroundColor: Colors.black12,
          )
        )
      )
    );
  }

  List<Widget> getPosts(var size) {
    List<Widget> postsWidget= [];
    for(int i=0; i< posts.length; i++) {
      postsWidget.add(
        PostWidget(data: posts[i])
      );
    }
    return postsWidget;
  }

  Future<void> getData() async {
    List<Post> data= await DataRepository().getPosts();
    setState(() {
      posts= data;
    });
  }
}