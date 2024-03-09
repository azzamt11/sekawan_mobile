import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sekawan_mobile/models/post.dart';
import 'package:sekawan_mobile/pages/post_detail_page.dart';

class PostWidget extends StatefulWidget {
  final Post data;
  const PostWidget({super.key, required this.data});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  Post post= Post();

  @override
  void initState() {
    setState(() {
      post= widget.data;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      margin: const EdgeInsets.only(top: 3, bottom: 3),
      child: Column(
        children: [
          header(size),
          body(size),
          mini(size),
          reaction(size)
        ],
      )
    );
  }

  Widget header(var size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: 100,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100, 
            width: max(size.width- 200, 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar(),
                const SizedBox(width: 10),
                name()
              ],
            )
          ),
          GestureDetector(
            onTap: () {
              getFloatingSnackBar(size, 'Mohon maaf, fitur ini belum tersedia', context);
            },
            child: const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: Icon(Icons.share, size: 25)
              )
            )
          )
        ],
      )
    );
  }

  Widget avatar() {
    return SizedBox(
      height: 85,
      width: 85,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 42.5,
            backgroundImage: NetworkImage(
              post.user.photo?? 'https://picsum.photos/250?image=9'
            ),
          ),
          Positioned(
            bottom: 8,
            right: 5,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            )
          )
        ],
      )
    );
  }

  Widget name() {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Text(
            post.user.name?? 'No-name',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '1 Jan 2024',
                  style: TextStyle(fontSize: 20, color: Colors.grey)
                ),
                Container(
                  height: 2,
                  width: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.grey,
                  ),
                ),
                const Icon(FontAwesomeIcons.networkWired, size: 15, color: Colors.grey)
              ],
            )
          )
        ],
      )
    );
  }

  Widget body(var size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      child: Text(
        post.body?? 'Empty',
        style: const TextStyle(fontSize: 26),
        softWrap: true,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget mini(var size)  {
    return Container(
      height: 30,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          post.like!> 0 
          ? const Icon(FontAwesomeIcons.heart, color: Colors.redAccent) 
          : const SizedBox(),
          Text(
            post.like.toString(), 
            style: const TextStyle(fontSize: 26, color: Colors.grey)
          )
        ],
      ) 
    );
  }

  Widget reaction(var size) {
    return Container(
      height: 50,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          reactionButton(
            size,
            FontAwesomeIcons.heart, 
            (post.liked?? false)? Colors.red: Colors.black, 
            'Like'
          ),
          const SizedBox(width: 10),
          reactionButton(
            size,
            FontAwesomeIcons.heart, 
            Colors.black, 
            'Comment'
          ),
        ],
      )
    );
  }

  Widget reactionButton(var size, IconData icon, Color color, String text) {
    return GestureDetector(
      onTap: () {
        if(text=='Like') {
          post.likePost();
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> 
              PostDetailPage(data: post)
            )
          );
        }
      },
      child: Container(
        height: 35,
        width: size.width/2,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.5),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon, 
              size: 25, 
              color: color
            ),
            const SizedBox(width: 10),
            Text(
              text, 
              style: const TextStyle(fontSize: 26, color: Colors.black)
            )
          ],
        )
      )
    );
  }

   void getFloatingSnackBar(var size, String string, BuildContext context) {
    SnackBar floatingSnackBar = SnackBar(
      content: Text(
        string,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
      margin:  EdgeInsets.only(
          bottom: (size.height / 2) - 40,
          left: size.width / 2 - 100,
          right: size.width / 2 - 100),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(floatingSnackBar);
  }

}