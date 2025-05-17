import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';

class NewestSection extends StatelessWidget {
  NewestSection({super.key});

  final List<F_Action> f_Actions = F_Action.f_Actions();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: f_Actions
            .asMap()
            .entries
            .map(
              (entry) => _AnimatedNewestCard(
                f_Action: entry.value,
                index: entry.key,
                onTap: () {
                  final info = Info(
                    entry.value.bgImage,
                    entry.value.icon,
                    entry.value.name,
                    entry.value.type,
                    entry.value.score,
                    entry.value.download,
                    entry.value.review,
                    entry.value.description,
                    entry.value.images,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(info),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AnimatedNewestCard extends StatefulWidget {
  final F_Action f_Action;
  final int index;
  final VoidCallback onTap;

  const _AnimatedNewestCard({
    required this.f_Action,
    required this.index,
    required this.onTap,
  });

  @override
  State<_AnimatedNewestCard> createState() => _AnimatedNewestCardState();
}

class _AnimatedNewestCardState extends State<_AnimatedNewestCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500 + widget.index * 80),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0.10, 0),
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
    final f_Action = widget.f_Action;
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedScale(
              scale: _hovering ? 1.025 : 1.0,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_hovering ? 0.18 : 0.10),
                      blurRadius: _hovering ? 22 : 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xFF5F67EA).withOpacity(0.09),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(f_Action.icon,
                          width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            f_Action.name,
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF23243A),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                f_Action.type,
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Row(
                                children: List.generate(
                                  5,
                                  (i) => Icon(
                                    Icons.star,
                                    size: 15,
                                    color: i < f_Action.score
                                        ? Colors.amber
                                        : Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 3, 3),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent.withOpacity(0.09),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Ouvrir',
                        style: TextStyle(
                          color: Color.fromARGB(255, 238, 161, 161),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
