import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:readmore/readmore.dart';

class DescriptionSection extends StatefulWidget {
  final Info info;
  const DescriptionSection(this.info, {super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
          child: ReadMoreText(
            widget.info.description,
            trimLines: 3,
            colorClickableText: const Color(0xFF5F67EA),
            trimMode: TrimMode.Line,
            trimCollapsedText: ' more',
            trimExpandedText: ' réduire',
            style: const TextStyle(
              color: Color(0xFF23243A),
              fontSize: 16,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
            moreStyle: const TextStyle(
              color: Color(0xFF5F67EA),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            lessStyle: const TextStyle(
              color: Color(0xFF5F67EA),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
