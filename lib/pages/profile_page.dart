import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
          children: [
            header(size),
            about(size),
            experiences(size),
            educations(size),
            projects(size),
          ],
        )
      )
    );
  }

  Widget header(var size) {
    return Container(
      height: 250,
      width: size.width,
      color: Colors.white,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Abdullah Azzam',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mobile Developer | Programmer | Mathematician | Computer Science Enthusiast',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Universitas Islam Negeri Maulana Malik Ibrahim Malang',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            )
          ),
          Container(
            height: 100,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg')
              )
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/author.png')
            ),
          ),
        ],
      )
    );
  }

  Widget about(var size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'I am a mathematician, self-taught mobile developer, and also computer science enthusiast. I have strong skill and passion in computer science especially in software engineering. I am in progress of pursuing my dream to be an artificial intelligence research scientist.',
            style: TextStyle(fontSize: 17),
          ),
        ],
      )
    );
  }

  Widget experiences(var size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Experiences',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          textBox(
            size,
            'assets/jojonomic.png',
            'Mobile Developer',
            'Jojonomic - The Future of Work . Fulltime',
            'Dec 2023 - March -2024',
            'Jakarta, Indonesia',
            'Hybrid',
            'Working as a part of a team to develop and maintain Jojonomic Officeless Mobile Application.',
            'Flutter and Android Development'    
          ),
        ],
      )
    );
  }

  Widget educations(var size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Educations',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          textBox(
            size,
            'assets/uin.png',
            'Universitas Islam Negeri Maulana Malik Ibrahim Malang',
            'Bachelor of Science - Mathematics',
            'Aug 2014 - Oct -2019',
            'Grade 2.86',
            '',
            'Activities and Societies: Programming, Writing Articles',
            ''    
          ),
        ],
      )
    );
  }

  Widget projects(size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Projects',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          projectsTextBox(
            size,
            'Mobile Application Development',
            'assets/mobile.png',
            'Jan 2023 - Aug 2023',
            'Asociated with Vokanesia',
          ),
        ],
      )
    );
  }

  Widget textBox(
    Size size,
    String image,
    String title,
    String subtitle,
    String period,
    String location,
    String type,
    String jobdesc,
    String skills,
  ) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image)
            ),
          ),
          Container(
            width: size.width- 150,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  period,
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  location,
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Text(
                  jobdesc,
                  style: const TextStyle(fontSize: 17),
                ),
                skills!= ''? const SizedBox(height: 30) : const SizedBox(),
                skills!= ''? SizedBox(
                  height: 100,
                  width: size.width- 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(FontAwesomeIcons.diamond, size: 20),
                      Text(
                        skills,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ) : const SizedBox(),
                const SizedBox(height: 15)
              ],
            )
          )
        ],
      )
    );
  }

  Widget projectsTextBox(
    Size size,
    String title,
    String image,
    String period,
    String jobdesc,
  ) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            period,
            style: const TextStyle(fontSize: 17),
          ),
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(image)
                ),
                const SizedBox(width: 20),
                Text(
                  jobdesc,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            )
          )
        ],
      )
    );
  }

  
}