import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/widgets/Review.dart';
import 'package:newtest/pages/detail/widgets/description.dart';
import 'package:newtest/pages/detail/widgets/galery.dart';
import 'package:newtest/pages/detail/widgets/header.dart';

class InformInfo extends StatelessWidget {
  final Info info;

  const InformInfo(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 252, 253),
      child: Column(
        children: [
          HeaderSec(info),
          GallerySection(info),
          DescriptionSection(info),
          ReviewSection(info),
        ],
      ),
    );
  }
}
