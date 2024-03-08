import 'package:flutter/material.dart';

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
        child: SizedBox(
          height: 140,
          width: 140,
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
    if (!context.mounted) return;
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context)=> const HomePage()  
      )
    );
  }

}