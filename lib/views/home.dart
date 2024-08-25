import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/desktop.dart';
import 'package:portfolio/views/mobile/mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobileView(),
      tablet: Container(color: Colors.yellow),
      desktop: const DesktopView(),
      watch: Container(color: Colors.purple),
    );
  }
}
