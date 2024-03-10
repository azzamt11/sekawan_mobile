import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


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
            independentProjects(size),
            skills(size),
            resume(size)
          ],
        )
      )
    );
  }

  Widget header(var size) {
    return Container(
      height: 300,
      width: size.width,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('background.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('author.jpg')
              ),
            )
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Abdullah Azzam',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mobile Developer | Programmer | Mathematician | Computer Science Enthusiast',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Universitas Islam Negeri Maulana Malik Ibrahim Malang',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            )
          ),
        ],
      )
    );
  }

  Widget about(var size) {
    return Container(
      color: Colors.white,
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'I am a mathematician, self-taught mobile developer, and also computer science enthusiast. I have strong skill and passion in computer science especially in software engineering. I am in progress of pursuing my dream to be an artificial intelligence research scientist.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      )
    );
  }

  Widget experiences(var size) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Experiences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          textBox(
            size,
            'jojonomic.png',
            'Mobile Developer',
            'Jojonomic - The Future of Work . Fulltime',
            'Dec 2023 - March -2024',
            'Jakarta, Indonesia',
            'Hybrid',
            'Working as a part of a team to develop and maintain Jojonomic Officeless Mobile Application.',
            'Skills: Flutter'    
          ),
          textBox(
            size,
            'vokanesia.jpeg',
            'Mobile Programmer',
            'PT Vokasi Indonesia Sejahtera . Fulltime',
            'Oct 2022 - Aug -2023',
            'Malang, East Java, Indonesia',
            'On-Site',
            "Build and maintain several Mobile Applications owned by Vokanesia's partner companies such as Quantum Book Mobile and the latest version of Temu Rejeki Mobile.",
            'Skills: Flutter'    
          ),
          textBox(
            size,
            'freelance.png',
            'Mobile Programmer',
            'Freelance . Fulltime',
            'Aug 2022 - Sept -2023',
            'Malang, East Java, Indonesia',
            'Remote',
            "Build and maintain several Mobile Applications for certain clients.",
            'Skills: Flutter'    
          ),
        ],
      )
    );
  }

  Widget educations(var size) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Educations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          textBox(
            size,
            'uin.jpg',
            'Universitas Islam Negeri Maulana Malik Ibrahim Malang',
            'Bachelor of Science - Mathematics',
            'Aug 2014 - Oct -2019',
            'Grade 3.86',
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
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          projectsTextBox(
            size,
            'QuantumBook Mobile',
            'vokanesia.jpeg',
            'Jan 2023 - Aug 2023',
            'Associated with Vokanesia',
            'https://play.google.com/store/apps/details?id=id.quantumbook&hl=en_US&pli=1'
          ),
          projectsTextBox(
            size,
            'TemuRejeki Mobile',
            'vokanesia.jpeg',
            'April 2023 - Aug 2023',
            'Associated with Vokanesia',
            'https://play.google.com/store/apps/details?id=com.temurejeki&hl=en&gl=US'
          ),
        ],
      )
    );
  }

  Widget independentProjects(size) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Independent Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          projectsTextBox(
            size,
            'Traveloka Mobile Clone',
            'flutter.png',
            'Sept 2023',
            'Framework: Flutter',
            'https://azzamtmcweb.netlify.app'
          ),
          projectsTextBox(
            size,
            'Snake And Ladder Game',
            'htmlcss.png',
            'Aug 2023',
            'Framework: Web Vanila',
            'https://azzamminiapps.netlify.app/snake-and-ladder'
          ),
          projectsTextBox(
            size,
            'Undraggable Tennis Game',
            'flutter.png',
            'June 2023',
            'Framework: Flutter with Firebase',
            'https://azzamtennisgamewebversion1.netlify.app'
          ),
        ],
      )
    );
  }

  Widget skills(var size) {
    return Container(
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          skillsTextBox(
            size,
            'flutter.png',
            'Flutter/Dart',
            'Level: Advanced' 
          ),
          skillsTextBox(
            size,
            'javascript.png',
            'JavaScript',
            'Level: Intermediate' 
          ),
          skillsTextBox(
            size,
            'react.png',
            'React.js',
            'Level: Intermediate' 
          ),
          skillsTextBox(
            size,
            'laravel.png',
            'PHP/Laravel',
            'Level: Intermediate' 
          ),
          skillsTextBox(
            size,
            'htmlcss.png',
            'HTML/CSS',
            'Level: Intermediate' 
          ),
        ],
      )
    );
  }

   Widget resume(var size) {
    return Container(
      color: Colors.white,
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resume',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Download my resume here...',
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    _launchInBrowser(Uri.parse('https://azzamfp.000webhostapp.com/azzam-new-cv.pdf'));
                  },
                  child: Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.open_in_browser, size: 15)
                      ],
                    )
                  )
                )
              ],
            )
          )
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
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image)
            ),
          ),
          Container(
            width: size.width- 150,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  period,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  jobdesc,
                  style: const TextStyle(fontSize: 12),
                ),
                skills!= ''? const SizedBox(height: 20) : const SizedBox(),
                skills!= ''? SizedBox(
                  height: 20,
                  width: size.width- 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.diamond, size: 7, color: Colors.blue),
                      const SizedBox(width: 10),
                      Text(
                        skills,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ) : const SizedBox(),
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
    String url
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            period,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(image)
                ),
                const SizedBox(width: 10),
                Text(
                  jobdesc,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            )
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _launchInBrowser(Uri.parse(url));
            },
            child: Container(
              width: 200,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Kunjungi Project', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 10),
                  Icon(Icons.open_in_browser, size: 12)
                ],
              )
            )
          )
        ],
      )
    );
  }

  Widget skillsTextBox(
    Size size,
    String image,
    String title,
    String subtitle,
  ) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: CircleAvatar(
              radius: 15,
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
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 5),
              ],
            )
          )
        ],
      )
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  
}