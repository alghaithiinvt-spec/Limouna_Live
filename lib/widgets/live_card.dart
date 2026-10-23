import 'package:flutter/material.dart';
import '../core/theme.dart';

class LiveCard extends StatelessWidget {
  final String name, subtitle;
  final String viewers;
  final List<Color> colors;
  const LiveCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.viewers,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text('LIVE',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              Row(children: [
                const Icon(Icons.remove_red_eye, size: 14, color: Colors.white70),
                const SizedBox(width: 3),
                Text(viewers, style: const TextStyle(fontSize: 12)),
              ]),
            ],
          ),
          const Spacer(),
          const Center(child: Icon(Icons.person, size: 64, color: Colors.white24)),
          const Spacer(),
          Text(name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.grey)),
        ],
      ),
    );
  }
}
