import 'package:flutter/material.dart';
import 'package:sekawan_mobile/components/post_widget.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
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
    for(int i=0; i< posts.length; i++) {
      postsWidget.add(
        PostWidget(data: posts[i])
      );
    }
    return postsWidget;
  }
}