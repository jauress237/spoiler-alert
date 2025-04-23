import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'What would you like to see?',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          CircleAvatar(
            child: Image.asset(
              'assets/images/WhatsApp Image 2025-04-12 à 01.32.10_e0c82537.jpg',
              fit: BoxFit.cover,
            ),
          ),
          CircleAvatar(
            child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class Style {}
