import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sekawan_mobile/pages/data_page.dart';
import 'package:sekawan_mobile/pages/profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeTab = 0;
  int counter= 0;

  double targetMargin = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      onPopInvoked: (bool isPop) async {
        if ( activeTab != 0) {
          setState(() {
            activeTab = 0;
          });
        } else {
          startCountingToExit();
          getFloatingSnackBar(
              size,
              "Tekan sekali lagi untuk keluar",
              context
          );
        }
      },
      child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  bottomNavigationBar: getFooter(size),
                  body: getBody(size)
              ),
            ],
          )
      )
    );
  }

  //Footer
  Widget getFooter(var size) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetMargin),
      duration: const Duration(milliseconds: 300),
      builder: (BuildContext context, double position, Widget? child) {
        return SizedBox(
            height: 60 - position,
            width: size.width,
            child: Stack(children: [
              Positioned(
                  top: 0,
                  child: Container(
                      height: 59,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.black12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getTabMenu(
                                  tabIcon(activeTab==0, 0, "Data"),
                                  0
                              ),
                              getTabMenu(
                                  tabIcon(activeTab==1, 1, "Profile"),
                                  1
                              ),                             
                            ]
                        ),
                      )
                  )
              )
            ])
        );
      },
    );
  }

  Widget getBody(var size) {
    return RefreshIndicator(
        onRefresh: () async{
          //on refresh
        },
        color: Colors.white,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: IndexedStack(
            key: ValueKey<int>(activeTab),
            index: activeTab,
            children: const [
              DataPage(),
              ProfilePage()
            ],
          )
        )
    );
  }

  Widget getTabMenu(List<Widget> tabIcon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = index;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tabIcon,
        ),
      ),
    );
  }

  List<Widget> tabIcon(bool isActive, int index, String text) {
    List<IconData> iconList= [
      Icons.folder,
      Icons.person
    ];
    return <Widget>[
      Icon(
          iconList[index],
          color: isActive
              ? Colors.deepPurple
              : Colors.black,
          size: 27
      ),
      Text(
          text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: isActive
                  ? Colors.deepPurple
                  : Colors.black,
              fontSize: 12
          )
      ),
    ];
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

  Future<void> startCountingToExit() async {
    setState(() {
      counter++;
    });
    if (counter == 2) {
      exit(1);
    }
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      counter = 0;
    });
  }

}