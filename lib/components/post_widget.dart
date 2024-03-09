import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sekawan_mobile/models/post.dart';
import 'package:sekawan_mobile/pages/post_detail_page.dart';
import 'package:sekawan_mobile/providers/state_provider.dart';

class PostWidget extends StatefulWidget {
  final int id;
  final bool liked;
  const PostWidget({Key? key, required this.id, required this.liked}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool liked= false;

  @override
  void initState() {
    liked= widget.liked;
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
          const SizedBox(height: 10),
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
    Post data= context.watch<StateProvider>().data[widget.id];
    return SizedBox(
      height: 61,
      width: 61,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30.5,
            backgroundImage: NetworkImage(
              data.user.photo
              ?? 'https://ui-avatars.com/api/?name=${data.user.name!.split(' ').join('+')}?background=random'
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
    Post data= context.watch<StateProvider>().data[widget.id];
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.user.name?? "user-${data.user.id.toString()}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '1 Jan 2024',
                  style: TextStyle(fontSize: 17, color: Colors.grey)
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
                const Icon(FontAwesomeIcons.globe, size: 15, color: Colors.grey)
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
        context.watch<StateProvider>().data[widget.id].body?? 'Empty',
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget mini(var size)  {
    int like= context.watch<StateProvider>().data[widget.id].like?? 0;
    int comment= context.watch<StateProvider>().data[widget.id].comment?? 0;
    return Container(
      height: 30,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          like> 0 
          ? const Icon(FontAwesomeIcons.heart, color: Colors.red, size: 17) 
          :  const Icon(FontAwesomeIcons.heart, color: Colors.grey, size: 17),
          const SizedBox(width: 10),
          like> 0? const Text(
            "You liked this post", 
            style: TextStyle(fontSize: 17, color:Colors.grey)
          ) : Text(
            "$like likes, $comment comments", 
            style: TextStyle(fontSize: 17, color:Colors.grey)
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
            liked? Colors.red: Colors.black, 
            'Like'
          ),
          const SizedBox(width: 5),
          reactionButton(
            size,
            FontAwesomeIcons.message, 
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
          setState(() {
            liked= !liked;
          });
          context.read<StateProvider>().like(widget.id);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> 
              PostDetailPage(data: context.watch<StateProvider>().data[widget.id])
            )
          );
        }
      },
      child: Container(
        height: 40,
        width: size.width/2- 12.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon, 
              size: 20, 
              color: color
            ),
            const SizedBox(width: 10),
            Text(
              text, 
              style: TextStyle(
                fontSize: 17, 
                color: text== 'Like' && liked? Colors.red: Colors.black
              )
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