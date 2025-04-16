import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:readmore/readmore.dart';

class DescriptionSection extends StatelessWidget {
  final Info info;
  const DescriptionSection(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ReadMoreText(
        info.description,
        trimLines: 2,
        colorClickableText: const Color(0xFF5F67EA),
        trimMode: TrimMode.Line,
        trimCollapsedText: 'more',
        trimExpandedText: ' reduire',
        // ignore: deprecated_member_use
        style: TextStyle(color: Colors.grey.withOpacity(0.7), height: 1.5),
      ),
    );
  }
}
