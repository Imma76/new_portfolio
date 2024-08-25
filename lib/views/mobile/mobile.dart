import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/views/desktop/desktop.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<MobileView> {
  List<MobileSkillsTile> skillList = [
    const MobileSkillsTile(image: "flutter.png", title: "Flutter"),
    const MobileSkillsTile(image: "dart.png", title: "Dart"),
    const MobileSkillsTile(image: "nodejs.png", title: "NodeJs"),
    const MobileSkillsTile(image: "express.png", title: "ExpressJs"),
    const MobileSkillsTile(image: "mongodb.png", title: "MongoDb"),
    const MobileSkillsTile(image: "nestjs.png", title: "NestJs"),
    const MobileSkillsTile(image: "firebase.png", title: "Firebase"),
    const MobileSkillsTile(
        image: "android_studio.jpeg", title: "Android Studio"),
    const MobileSkillsTile(image: "prisma.png", title: "Prisma"),
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
      // print("here400 ${{
      //   'name': nameController.text,
      //   'sender': emailController.text,
      //   'receiver': emailController.text,
      //   'message': messageController.text,
      // }}");
      Uri uri = Uri.parse('https://email-service-fsmn.onrender.com/mail');
      // print(uri);
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
      // print(request.body);
      if (request.statusCode == 200) {
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        if (!mounted) return;
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
        if (!mounted) return;
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
      // print(e.toString());
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // drawer: const Drawer(
      //   child: ,
      // ),
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      //
      //   //     toolbarHeight: 200,
      //   centerTitle: false,
      //   title: Text('Emmanuel Ugwueze',
      //       style: GoogleFonts.bebasNeue(
      //           color: const Color(0xFFC7C7C7), fontSize: 25)),
      //   actions: [
      //     Text('Work',
      //         style: GoogleFonts.inter(
      //             color: const Color(0xFFC7C7C7), fontSize: 16)),
      //     const Gap(20),
      //     Text('About',
      //         style: GoogleFonts.inter(
      //             color: const Color(0xFFC7C7C7), fontSize: 16)),
      //     const Gap(20),
      //     Text('Contact',
      //         style: GoogleFonts.inter(
      //             color: const Color(0xFFC7C7C7), fontSize: 16)),
      //     const Gap(20),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(100),
                  Text('HI, I AM \nEmmanuel Ugwueze.',
                      style: GoogleFonts.bebasNeue(
                          height: 1,
                          letterSpacing: 0,
                          color: const Color(0xFFC7C7C7),
                          fontSize: 43)),
                  const Gap(8),
                  Text(
                      'I am a software engineer with a passion for building scalable and reliable software solutions.',
                      style: GoogleFonts.manrope(
                          color: const Color(0xFFC7C7C7),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const Gap(20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Scrollable.ensureVisible(
                                    ThemeController.contactMe.currentContext!,
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.ease,
                                  ));
                        },
                        child: Container(
                          width: 120,
                          height: 34,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD3E97A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'CONTACT ME',
                                  style: TextStyle(
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    height: 0.06,
                                  ),
                                ),
                                const Gap(5),
                                Image.asset(
                                  "assets/contact_circle.png",
                                  width: 15,
                                  height: 15,
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
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          launchUrl("https://github.com/Imma76");
                        },
                        child: Image.asset(
                          "assets/github.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Gap(40),
              SizedBox(
                height: 300,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/70198597?v=4',
                  fit: BoxFit.cover,
                ),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const Gap(80),
              const ProjectTileMobile(
                title: 'Food Ninja',
                description: 'Food Ordering App UI',
                image: 'food_ninja.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2024',
                  size: 16,
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                  size: 16,
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart',
                  size: 16,
                ),
              ),
              const Gap(120),
              const ProjectTileMobile(
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
                  size: 16,
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                  size: 16,
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  size: 16,
                  subTitle: 'Flutter, Dart',
                ),
              ),
              const Gap(120),
              const ProjectTileMobile(
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
                  size: 16,
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  size: 16,
                  subTitle: 'Flutter developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  size: 16,
                  subTitle: 'Flutter, Dart, expressJs, NodeJs',
                ),
              ),
              const Gap(120),
              const ProjectTileMobile(
                title: 'Consult',
                viewOnGitHub: ViewOnGithub(
                    url: "https://github.com/Imma76/consult_patient"),
                description:
                    'Teamed up with a designer to breathe life into an application to get professional consultation from the best consultants around you',
                image: 'consult.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  size: 16,
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Flutter developer',
                  size: 16,
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  subTitle: 'Flutter, Dart',
                  size: 16,
                ),
              ),
              const Gap(120),
              const ProjectTileMobile(
                title: 'Todo Backend Application',
                viewOnGitHub: ViewOnGithub(
                  url: "https://github.com/Imma76/nest_todo",
                  size: 12,
                  width: 120,
                ),
                description:
                    'A backend application that allows users to create, read, update, and delete todos',
                image: 'nest_todo.png',
                // link1: '',
                viewDocumentation: ViewDocumentation(
                  size: 12,
                  width: 156,
                  url:
                      "https://documenter.getpostman.com/view/30310602/2sA3XJjQ7z",
                ),
                year: DetailsTile(
                  title: 'Year',
                  size: 16,
                  subTitle: '2023',
                ),
                role: DetailsTile(
                  title: 'Role',
                  size: 16,
                  subTitle: 'Backend developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  size: 16,
                  subTitle: 'nestJs, NodeJs, Prisma, postgres',
                ),
              ),
              const Gap(120),
              const ProjectTileMobile(
                title: 'Blog Backend Application',
                viewOnGitHub: ViewOnGithub(
                  url: "https://github.com/Imma76/sql_blog",
                ),
                description:
                    'A backend blog application that allows users to create, read, update, and delete blogs, built with expressjs & sql',
                image: 'nest_blog.png',
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                  size: 16,
                ),
                role: DetailsTile(
                  title: 'Role',
                  subTitle: 'Backend developer',
                  size: 16,
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  size: 16,
                  subTitle: 'expressjs, nodejs, postgres',
                ),
                //viewDocumentation: ViewDocumentation(url: '',),
              ),
              const Gap(120),
              const ProjectTileMobile(
                title: 'Genesys Blog Backend Application',
                description:
                    'A backend blog application that allows users to create, read, update, and delete blogs, built with expressJs',
                image: 'genesys_blog.png',
                viewOnGitHub: ViewOnGithub(
                    size: 10,
                    width: 100,
                    url:
                        "https://github.com/Genesys-interns/Genesys-blog-backend/tree/develop"),
                // link1: '',
                year: DetailsTile(
                  title: 'Year',
                  subTitle: '2023',
                  size: 16,
                ),
                role: DetailsTile(
                  title: 'Role',
                  size: 16,
                  subTitle: 'Backend developer',
                ),
                stack: DetailsTile(
                  title: 'Stack',
                  size: 10,
                  subTitle: 'expressjs, nodejs, MongoDb',
                ),
                viewDocumentation: ViewDocumentation(
                    size: 8,
                    width: 90,
                    url:
                        'https://documenter.getpostman.com/view/21945976/UzQuQmPL'),
              ),
              const Gap(80),
              SizedBox.fromSize(size: Size.zero, key: ThemeController.about),
              Text('ABOUT ME',
                  style: GoogleFonts.bebasNeue(
                      height: 0,
                      letterSpacing: 0,
                      color: Colors.white,
                      fontSize: 43)),
              Column(
                children: [
                  // const Gap(20),
                  // Text(
                  //     'I am a software engineer with a passion for building scalable and reliable software solutions.',
                  //     style: GoogleFonts.manrope(
                  //         height: 0,
                  //         letterSpacing: 0,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.white,
                  //         fontSize: 25)),
                  const Gap(20),
                  Text(
                      'I am a software engineer  with over 4 years of experience in building high-quality mobile applications. Proficient in Flutter and Dart, with expertise in creating scalable cross-platform apps for both Android and iOS. Skilled in backend development using Node.js, with a strong focus on delivering innovative solutions that drive business growth. Adept at collaborating with teams and staying up-to-date with the latest technologies. Seeking to contribute to a dynamic team in a challenging and rewarding environment.',
                      style: GoogleFonts.manrope(
                          height: 1,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFC7C7C7),
                          fontSize: 15)),
                  const Gap(20),
                  GridView.builder(
                      itemCount: skillList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 80,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return skillList[index];
                      }),
                  const Gap(20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl(
                              "https://docs.google.com/document/d/1NmAZupuhCGUM71l1gNeienj7-pZ6OD9z/edit?usp=sharing&ouid=116244184198050482299&rtpof=true&sd=true");
                        },
                        child: Container(
                          width: 170,
                          height: 34,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD3E97A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'DOWNLOAD RESUME',
                                  style: TextStyle(
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 10,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    height: 0.06,
                                  ),
                                ),
                                const Gap(5),
                                Image.asset(
                                  "assets/contact_circle.png",
                                  width: 15,
                                  height: 15,
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
                          width: 35,
                          height: 35,
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          launchUrl("https://github.com/Imma76");
                        },
                        child: Image.asset(
                          "assets/github.png",
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Gap(120),
              SizedBox.fromSize(
                  size: Size.zero, key: ThemeController.contactMe),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LET\'S CONNECT',
                      style: GoogleFonts.bebasNeue(
                          height: 1,
                          letterSpacing: 0,
                          color: Colors.white,
                          fontSize: 43)),
                  Text('Say hello at emmanuelchika40@gmail.com',
                      style: GoogleFonts.manrope(
                          height: 1,
                          letterSpacing: 0,
                          color: const Color(0xFFC7C7C7),
                          fontSize: 16)),
                  Text('For more info here is my resume',
                      style: GoogleFonts.manrope(
                          height: 1,
                          letterSpacing: 0,
                          color: const Color(0xFFC7C7C7),
                          fontSize: 16)),
                  const Gap(20),
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
                  const Gap(20),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  load
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            await submit();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD3E97A),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              fixedSize: const Size(double.infinity, 44),
                              minimumSize: const Size(double.infinity, 44)),
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
              const Gap(200),
              Text('© 2024 Emmanuel Chika',
                  style: GoogleFonts.manrope(
                      height: 0,
                      letterSpacing: 0,
                      color: const Color(0xFFC7C7C7),
                      fontSize: 18)),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeController {
  static final contactMe = GlobalKey(debugLabel: "contactMe");
  static final works = GlobalKey(debugLabel: "works");
  static final about = GlobalKey(debugLabel: "about");
}

class MobileSkillsTile extends StatelessWidget {
  final String title;
  final String image;
  const MobileSkillsTile({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      padding: const EdgeInsets.all(3),
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
