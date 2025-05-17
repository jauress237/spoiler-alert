import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'dart:ui';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Info info;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate({
    required this.info,
    required this.expandedHeight,
    required this.roundedContainerHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double blur = (shrinkOffset / expandedHeight) * 12;
    final double opacity = 1 - (shrinkOffset / expandedHeight).clamp(0, 1);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Image de fond avec blur animé
        Image.asset(
          info.bgImage,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        if (blur > 0)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        // Dégradé sombre pour la lisibilité
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.55),
                Colors.transparent,
                Colors.black.withOpacity(0.25),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        // Bouton retour moderne
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 20,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.65),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF23243A),
                  size: 22,
                ),
              ),
            ),
          ),
        ),
        // Arrondi bas avec effet glassmorphism
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: opacity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: roundedContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 126, 130, 192)
                        .withOpacity(0.82),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 16,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
