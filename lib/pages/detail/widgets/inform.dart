import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/widgets/Review.dart';
import 'package:newtest/pages/detail/widgets/description.dart';
import 'package:newtest/pages/detail/widgets/galery.dart';
import 'package:newtest/pages/detail/widgets/header.dart';

class InformInfo extends StatefulWidget {
  final Info info;

  const InformInfo(this.info, {super.key});

  @override
  State<InformInfo> createState() => _InformInfoState();
}

class _InformInfoState extends State<InformInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
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
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 252, 253),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderSec(widget.info),
              const SizedBox(height: 8),
              GallerySection(widget.info),
              const SizedBox(height: 8),
              DescriptionSection(widget.info),
              const SizedBox(height: 8),
              ReviewSection(widget.info),
            ],
          ),
        ),
      ),
    );
  }
}
