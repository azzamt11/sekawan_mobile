import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sekawan_mobile/models/post.dart';
import 'package:sekawan_mobile/providers/state_provider.dart';
import 'package:sekawan_mobile/services/data_repository.dart';

import './home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  double colorParam= 0;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(size),
    );
  }

  Widget getBody(var size) {
    return Container(
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Center(
        child: Container(
          height: 140,
          width: 140,
          margin: const EdgeInsets.only(bottom: 50),
          child: Stack(
            children: [
              logo(),
              barrier()
            ],
          )
        )
      )
    );
  }

  Widget logo() {
    return Container(
      height: 140,
      width: 140,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/sekawan_logo.png'
          )
        )
      ),
    );
  }

  Widget barrier() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: colorParam),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double param, Widget? child) {
        return Container(
          height: 140,
          width: 140,
          color: Color.fromRGBO(255, 255, 255, 1- param),
        );
      }
    );
  }

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      colorParam= 1;
    });
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<Post> data= await DataRepository().getPosts();
      if (!context.mounted) return;
      await context.read<StateProvider>().setData(data);
      if(data.isNotEmpty) {
        if (!context.mounted) return;
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context)=> const HomePage()  
          )
        );
      }
    } catch(e) {
      debugPrint('azzam_debug; ${e.toString()}');
    }
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