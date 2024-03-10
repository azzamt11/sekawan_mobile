import 'package:flutter/material.dart';
import 'package:sekawan_mobile/components/avatar.dart';
import 'package:sekawan_mobile/components/post_widget.dart';
import 'package:sekawan_mobile/services/data_repository.dart';

import '../models/post.dart';

class DataDetailPage extends StatefulWidget {
  final bool liked;
  final int id;
  final int postId;
  const DataDetailPage({super.key, required this.id, required this.liked, required this.postId});

  @override
  State<DataDetailPage> createState() => _DataDetailPageState();
}

class _DataDetailPageState extends State<DataDetailPage> {
  List<Comment> comments= [];

  @override
  void initState() {
    getComments();
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
      color: Colors.white,
      margin: const EdgeInsets.only(top: 3),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PostWidget(id: widget.id, liked: widget.liked, postId: widget.postId),
            SizedBox(
              height: 30,
              width: size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Semua Komentar', style: TextStyle(fontSize: 15)),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down, size: 17),
                ],
              )
            ),
            comments.isEmpty
            ? Container(
              height: 300,
              width: size.width,
              color: Colors.transparent,
              child: const Center(
                child: Text('Tidak ada comment', style: TextStyle(fontSize: 15)),
              )
            ) 
            : SizedBox(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments.map((data) => commentWidget(data, size)).toList(),
              )
            )
          ],
        )
      ),
    );
  }

  Widget commentWidget(Comment data, var size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(
            radius: 20,
            url: 'https://ui-avatars.com/api/?name=${data.name!.split(' ').join('+')}?background=random'
          ),
          const SizedBox(width: 10),
          Container(
            width: size.width- 20- 50- 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black12,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  data.body,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            )
          ),
        ],
      ),
    );
  }

  Future<void> getComments() async {
    List<Comment> data= await DataRepository().getComments(widget.postId);
    setState(() {
      comments= data;
    });
  }

}