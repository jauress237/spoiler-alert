import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/Home/widgets/header.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/home/widgets/category.dart';
import 'package:newtest/pages/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset('assets/images/bg_liquid.png', width: 180),
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset('assets/images/bg_liquid.png', width: 200),
              ),
            ),
            Column(
              children: [
                HeaderSection(),
                SearchSection(),
                CategorySection(),
                NewestSection(),
                SearchSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
