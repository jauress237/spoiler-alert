import 'dart:ui';
import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.blueAccent.withOpacity(_isFocused ? 0.18 : 0.10),
                  blurRadius: _isFocused ? 24 : 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: TextField(
                  cursorColor: const Color(0xFF5F67EA),
                  onTap: () => setState(() => _isFocused = true),
                  onEditingComplete: () => setState(() => _isFocused = false),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 20,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 28,
                      color: Color(0xFF5F67EA),
                    ),
                    hintText: "Rechercher un film, une série...",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 18,
            child: GestureDetector(
              onTapDown: (_) => setState(() => _isFocused = true),
              onTapUp: (_) => setState(() => _isFocused = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: _isFocused
                      ? const Color(0xFF5F67EA).withOpacity(0.85)
                      : const Color(0xFF5F67EA),
                  boxShadow: [
                    if (_isFocused)
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.18),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: const Icon(
                  Icons.mic_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
