import 'dart:js' as js;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/views/mobile/mobile.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  List<SkillsTile> skillList = [
    const SkillsTile(image: "flutter.png", title: "Flutter"),
    const SkillsTile(image: "dart.png", title: "Dart"),
    const SkillsTile(image: "nodejs.png", title: "NodeJs"),
    const SkillsTile(image: "express.png", title: "ExpressJs"),
    const SkillsTile(image: "mongodb.png", title: "MongoDb"),
    const SkillsTile(image: "nestjs.png", title: "NestJs"),
    const SkillsTile(image: "firebase.png", title: "Firebase"),
    const SkillsTile(image: "android_studio.jpeg", title: "Android Studio"),
    const SkillsTile(image: "prisma.png", title: "Prisma"),
  ];
  bool load = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  Future submit() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        subjectController.text.isEmpty ||
        messageController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (builder) => AlertDialog(
                title: const Text('Error'),
                content: const Text('All fields are required'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    }
    setState(() {
      load = true;
    });

    try {
      print("here400 ${{
        'name': nameController.text,
        'sender': emailController.text,
        'receiver': emailController.text,
        'message': messageController.text,
      }}");
      Uri uri = Uri.parse('https://email-service-fsmn.onrender.com/mail');
      print(uri);
      var request = await http.post(
        uri,
        body: {
          'name': nameController.text.trim(),
          'sender': emailController.text.trim(),
          'receiver': 'emmanuelchika30@gmail.com',
          'message':
              'from ${emailController.text} ${messageController.text.trim()}',
        },
      );
      print(request.body);
      if (request.statusCode == 200) {
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        showDialog(
            context: context,
            builder: (builder) => AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Message has been sent successfully!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'))
                  ],
                ));
      } else {
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        showDialog(
            context: context,
            builder: (builder) => AlertDialog(
                  title: const Text('Failed'),
                  content: const Text('Error Occurred!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'))
                  ],
                ));
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //     toolbarHeight: 200,
        centerTitle: false,
        title: Text('Emmanuel Ugwueze',
            style: GoogleFonts.bebasNeue(
                color: const Color(0xFFC7C7C7), fontSize: 32)),
        actions: [
          GestureDetector(
            onTap: () {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => Scrollable.ensureVisible(
                        ThemeController.works.currentContext!,
                        duration: const Duration(seconds: 2),
                        curve: Curves.ease,
                      ));
            },
            child: Text('Work',
                style: GoogleFonts.inter(
                    color: const Color(0xFFC7C7C7), fontSize: 16)),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => Scrollable.ensureVisible(
                        ThemeController.about.currentContext!,
                        duration: const Duration(seconds: 2),
                        curve: Curves.ease,
                      ));
            },
            child: Text('About',
                style: GoogleFonts.inter(
                    color: const Color(0xFFC7C7C7), fontSize: 16)),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => Scrollable.ensureVisible(
                        ThemeController.contactMe.currentContext!,
                        duration: const Duration(seconds: 2),
                        curve: Curves.ease,
                      ));
            },
            child: Text('Contact',
                style: GoogleFonts.inter(
                    color: const Color(0xFFC7C7C7), fontSize: 16)),
          ),
          const Gap(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(100),
                        Text('HI, I AM \nEmmanuel Ugwueze.',
                            style: GoogleFonts.bebasNeue(
                                height: 0,
                                letterSpacing: 0,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 97)),
                        const Gap(8),
                        Text(
                            'I am a software engineer with a passion for building scalable and reliable software solutions.',
                            style: GoogleFonts.manrope(
                                color: const Color(0xFFC7C7C7),
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        const Gap(20),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => Scrollable.ensureVisible(
                                          ThemeController
                                              .contactMe.currentContext!,
                                          duration: const Duration(seconds: 2),
                                          curve: Curves.ease,
                                        ));
                              },
                              child: Container(
                                width: 187,
                                height: 54,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD3E97A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'CONTACT ME',
                                        style: TextStyle(
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 16,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w700,
                                          height: 0.06,
                                        ),
                                      ),
                                      const Gap(5),
                                      Image.asset(
                                        "assets/contact_circle.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    "https://www.linkedin.com/in/emmanuel-ugwueze-8b5686168/");
                              },
                              child: Image.asset(
                                "assets/linkedin.png",
                                width: 54,
                                height: 54,
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                launchUrl("https://github.com/Imma76");
                              },
                              child: Image.asset(
                                "assets/github.png",
                                width: 54,
                                height: 54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(40),
                  Expanded(
                    child: SizedBox(
                      height: 663,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/70198597?v=4',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(80),
              SizedBox.fromSize(size: Size.zero, key: ThemeController.works),
              Text('FEATURED PROJECTS',
                  style: GoogleFonts.bebasNeue(
                      height: 0,
                      letterSpacing: 0,
                      color: const Color(0xFFC7C7C7),
                      fontSize: 43)),
              const Gap(8),
              Text(
                  'Here are some of the selected projects that showcase my skills and experience.',
                  style: GoogleFonts.manrope(
                      color: const Color(0xFFC7C7C7),
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              const Gap(80),
              const ProjectTile(
                title: 'Food Ninja',
                description: 'Food Ordering App UI',
                image: 'food_ninja.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2024',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart',
                ),
              ),
              const Gap(120),
              const ProjectTile(
                viewOnGitHub:
                    ViewOnGithub(url: "https://github.com/Imma76/allNews"),
                title: 'All News',
                description:
                    'A news app that provides you with the latest news from multiple sources. It also allows you to search for news articles from about 64 countries based on your selection',
                image: 'allnews.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart',
                ),
              ),
              const Gap(120),
              const ProjectTile(
                viewSite: ViewButton(
                    title: 'view site',
                    url:
                        "https://timmytestdomain123.co/home/salon?id=65d54949997b1934f6a46580"),
                title: 'Salon Booking Web App',
                description:
                    'A web application that allows users to book customers to appointments with salons online.',
                image: 'salon_booking_app.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart, expressJs, NodeJs',
                ),
              ),
              const Gap(120),
              const ProjectTile(
                title: 'Consult',
                viewOnGitHub: ViewOnGithub(
                    url: "https://github.com/Imma76/consult_patient"),
                description:
                    'Teamed up with a designer to breathe life into an application to get professional consultation from the best consultants around you',
                image: 'consult.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart',
                ),
              ),
              const Gap(120),
              const ProjectTile(
                title: 'Todo Backend Application',
                viewOnGitHub:
                    ViewOnGithub(url: "https://github.com/Imma76/nest_todo"),
                description:
                    'A backend application that allows users to create, read, update, and delete todos',
                image: 'nest_todo.png',
                // link1: '',
                viewDocumentation: ViewDocumentation(
                  url:
                      "https://documenter.getpostman.com/view/30310602/2sA3XJjQ7z",
                ),
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Backend developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'nestJs, NodeJs, Prisma, postgres',
                ),
              ),
              const Gap(120),
              const ProjectTile(
                title: 'Blog Backend Application',
                viewOnGitHub:
                    ViewOnGithub(url: "https://github.com/Imma76/sql_blog"),
                description:
                    'A backend blog application that allows users to create, read, update, and delete blogs, built with expressjs & sql',
                image: 'nest_blog.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Backend developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'expressjs, nodejs, postgres',
                ),
                //viewDocumentation: ViewDocumentation(url: '',),
              ),
              const Gap(120),
              const ProjectTile(
                title: 'Genesys Blog Backend Application',
                description:
                    'A backend blog application that allows users to create, read, update, and delete blogs, built with expressJs',
                image: 'genesys_blog.png',
                viewOnGitHub: ViewOnGithub(
                    url:
                        "https://github.com/Genesys-interns/Genesys-blog-backend/tree/develop"),
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Backend developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'expressjs, nodejs, MongoDb',
                ),
                viewDocumentation: ViewDocumentation(
                    url:
                        'https://documenter.getpostman.com/view/21945976/UzQuQmPL'),
              ),
              const Gap(80),
              SizedBox.fromSize(size: Size.zero, key: ThemeController.about),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ABOUT ME',
                            style: GoogleFonts.bebasNeue(
                                height: 0,
                                letterSpacing: 0,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 43)),
                        const Gap(230),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        //  const Gap(120),
                        Text(
                            'I am a software engineer  with over 4 years of experience in building high-quality mobile applications. Proficient in Flutter and Dart, with expertise in creating scalable cross-platform apps for both Android and iOS. Skilled in backend development using Node.js, with a strong focus on delivering innovative solutions that drive business growth. Adept at collaborating with teams and staying up-to-date with the latest technologies. Seeking to contribute to a dynamic team in a challenging and rewarding environment.',
                            style: GoogleFonts.manrope(
                                height: 0,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 18)),
                        const Gap(20),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    "https://docs.google.com/document/d/1NmAZupuhCGUM71l1gNeienj7-pZ6OD9z/edit?usp=sharing&ouid=116244184198050482299&rtpof=true&sd=true");
                              },
                              child: Container(
                                width: 187,
                                height: 54,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD3E97A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'DOWNLOAD RESUME',
                                        style: TextStyle(
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 13,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w700,
                                          height: 0.06,
                                        ),
                                      ),
                                      const Gap(5),
                                      Image.asset(
                                        "assets/contact_circle.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    "https://www.linkedin.com/in/emmanuel-ugwueze-8b5686168/");
                              },
                              child: Image.asset(
                                "assets/linkedin.png",
                                width: 54,
                                height: 54,
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                launchUrl("https://github.com/Imma76");
                              },
                              child: Image.asset(
                                "assets/github.png",
                                width: 54,
                                height: 54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Gap(120),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MY CAPABILITIES',
                            style: GoogleFonts.bebasNeue(
                                height: 0,
                                letterSpacing: 0,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 43)),
                        const Gap(350),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        //  const Gap(120),
                        Text(
                            'I have a strong foundation in software engineering and a passion for building scalable and reliable software solutions. I am proficient in Flutter and Dart, with expertise in creating scalable cross-platform apps for both Android and iOS. I am also skilled in backend development using Node.js.',
                            style: GoogleFonts.manrope(
                                height: 0,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 18)),
                        const Gap(20),
                        GridView.builder(
                            itemCount: skillList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 80,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return skillList[index];
                            }),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(150),
              SizedBox.fromSize(
                  size: Size.zero, key: ThemeController.contactMe),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LET\'S CONNECT',
                            style: GoogleFonts.bebasNeue(
                                height: 0,
                                letterSpacing: 0,
                                color: Colors.white,
                                fontSize: 43)),
                        Text('Say hello at emmanuelchika40@gmail.com',
                            style: GoogleFonts.manrope(
                                height: 0,
                                letterSpacing: 0,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 18)),
                        Text('For more info here is my resume',
                            style: GoogleFonts.manrope(
                                height: 0,
                                letterSpacing: 0,
                                color: const Color(0xFFC7C7C7),
                                fontSize: 18)),
                        const Gap(50),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    "https://www.linkedin.com/in/emmanuel-ugwueze-8b5686168/");
                              },
                              child: Image.asset("assets/linkedin.png",
                                  width: 35, height: 35),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrl("https://github.com/Imma76");
                              },
                              child: Image.asset("assets/github.png",
                                  width: 35, height: 35),
                            ),
                          ],
                        ),
                        const Gap(400),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text('© 2024 Emmanuel Chika',
                        //         style: GoogleFonts.manrope(
                        //             height: 0,
                        //             letterSpacing: 0,
                        //             color: const Color(0xFFC7C7C7),
                        //             fontSize: 18)),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(80),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Name',
                              style: GoogleFonts.manrope(
                                  height: 0,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16)),
                        ),
                        const Gap(10),
                        CustomTextField(
                          controller: nameController,
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Email',
                              style: GoogleFonts.manrope(
                                  height: 0,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16)),
                        ),
                        const Gap(10),
                        CustomTextField(
                          controller: emailController,
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Subject',
                              style: GoogleFonts.manrope(
                                  height: 0,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16)),
                        ),
                        const Gap(10),
                        CustomTextField(
                          controller: subjectController,
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text('Message',
                              style: GoogleFonts.manrope(
                                  height: 0,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16)),
                        ),
                        const Gap(10),
                        CustomTextField(
                          height: 300,
                          controller: messageController,
                        ),
                        const Gap(20),
                        ElevatedButton(
                            onPressed: () async {
                              await submit();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD3E97A),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                fixedSize: const Size(140, 54)),
                            child: Text(
                              'Submit',
                              style: GoogleFonts.libreFranklin(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0A0A0A),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsTile extends StatelessWidget {
  final String title;
  final String image;
  const SkillsTile({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: 200,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF484848)),
          borderRadius: BorderRadius.circular(70),
        ),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 0.06,
            ),
          ),
          const Gap(9),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/$image",
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key, this.height, this.width, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 600,
      height: height ?? 51,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(5),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x115A6CEA),
            blurRadius: 50,
            offset: Offset(12, 26),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          style: GoogleFonts.libreFranklin(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: '',
            hintStyle: GoogleFonts.libreFranklin(
                color: Colors.white.withOpacity(0.30), fontSize: 14),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final ViewOnGithub? viewOnGitHub;
  final DetailsTile year;
  final DetailsTile role;
  final DetailsTile stack;
  final ViewButton? viewSite;
  final ViewDocumentation? viewDocumentation;

  const ProjectTile(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.year,
      this.viewOnGitHub,
      this.viewDocumentation,
      this.viewSite,
      required this.role,
      required this.stack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
          width: 600,
          height: 600,
          decoration: ShapeDecoration(
            color: const Color(0xFF1A1A1A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/$image")),
          ),
        )),
        const Gap(40),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: Colors.white,
                    fontSize: 32)),
            Text(description,

                // 'A news app that provides you with the latest news from multiple sources. It also allows you to search for news articles from about 64 countries based on your selection',
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFC7C7C7),
                    fontSize: 18)),
            const Gap(20),
            const DetailsTile(
              title: 'PROJECT INFO',
            ),
            const Gap(20),
            year,
            const Gap(20),
            role,
            const Gap(20),
            stack,
            const Gap(20),
            Row(
              children: [
                viewSite ?? viewOnGitHub ?? const SizedBox(),
                const Gap(20),
                viewDocumentation ?? const SizedBox()
              ],
            ),
          ],
        ))
      ],
    );
  }
}

class ProjectTileMobile extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final ViewOnGithub? viewOnGitHub;
  final DetailsTile year;
  final DetailsTile role;
  final DetailsTile stack;
  final ViewButton? viewSite;
  final ViewDocumentation? viewDocumentation;

  const ProjectTileMobile(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.year,
      this.viewOnGitHub,
      this.viewDocumentation,
      this.viewSite,
      required this.role,
      required this.stack});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.manrope(
                    height: 1,
                    letterSpacing: 0,
                    color: Colors.white,
                    fontSize: 18)),
            const Gap(20),
            Text(description,

                // 'A news app that provides you with the latest news from multiple sources. It also allows you to search for news articles from about 64 countries based on your selection',
                style: GoogleFonts.manrope(
                    height: 1,
                    letterSpacing: 0,
                    color: const Color(0xFFC7C7C7),
                    fontSize: 16)),
            const Gap(20),
            const DetailsTile(
              title: 'PROJECT INFO',
              size: 12,
            ),
            const Gap(20),
            year,
            const Gap(20),
            role,
            const Gap(20),
            stack,
            const Gap(20),
            Row(
              children: [
                viewSite ?? viewOnGitHub ?? const SizedBox(),
                const Gap(20),
                viewDocumentation ?? const SizedBox()
              ],
            ),
          ],
        ),
        const Gap(40),
        Container(
          width: 600,
          height: 300,
          decoration: ShapeDecoration(
            color: const Color(0xFF1A1A1A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/$image")),
          ),
        ),
      ],
    );
  }
}

class ViewOnGithub extends StatelessWidget {
  final double? width;
  final double? size;
  final String url;
  const ViewOnGithub({super.key, required this.url, this.width, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url);
      },
      child: Container(
        width: width ?? 120,
        height: 40,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xFF484848), width: 1))),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("VIEW ON GITHUB",
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFD3E97A),
                    fontSize: size ?? 12)),
            const Gap(5),
            Image.asset("assets/github.png", width: size ?? 20, height: 20),
          ],
        ),
      ),
    );
  }
}

class ViewDocumentation extends StatelessWidget {
  final String url;
  final double? width;
  final double? size;
  const ViewDocumentation(
      {super.key, required this.url, this.size, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url);
      },
      child: Container(
        width: width ?? 165,
        height: 40,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xFF484848), width: 1))),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("VIEW DOCUMENTATION",
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFD3E97A),
                    fontSize: size ?? 12)),
            const Gap(5),
            Image.asset("assets/arrow.png", width: 17, height: 17),
          ],
        ),
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  final String url;
  final String title;
  final double? width;
  final double? size;
  const ViewButton(
      {super.key,
      required this.url,
      required this.title,
      this.size,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url);
      },
      child: Container(
        width: width ?? 100,
        height: 40,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xFF484848), width: 1))),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title.toUpperCase(),
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFD3E97A),
                    fontSize: size ?? 12)),
            const Gap(5),
            Image.asset("assets/arrow.png", width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}

class DetailsTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final double? width;
  final double? size;
  const DetailsTile(
      {super.key, this.subTitle, required this.title, this.size, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFF484848), width: 1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFC7C7C7),
                    fontSize: size ?? 18)),
            Text(subTitle ?? '',
                style: GoogleFonts.manrope(
                    height: 0,
                    letterSpacing: 0,
                    color: const Color(0xFFC7C7C7),
                    fontSize: size ?? 18))
          ],
        ),
      ),
    );
  }
}

Future<void> launchUrl(String url) async {
  js.context.callMethod('open', [url]);
}
