import 'dart:async';
import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2600), () {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            const Text('🍋', style: TextStyle(fontSize: 120)),
            const Text('ليمونة',
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w900,
                    color: AppColors.yellow,
                    shadows: [Shadow(color: AppColors.yellow, blurRadius: 24)])),
            const Text('LIVE',
                style: TextStyle(
                    letterSpacing: 8, color: AppColors.yellow, fontSize: 16)),
            const SizedBox(height: 24),
            const Text('مشاهدة .. تواصل .. أصدقاء جدد',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            const Spacer(flex: 3),
            SizedBox(
              width: 220,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 2400),
                builder: (_, v, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                      value: v,
                      minHeight: 4,
                      color: AppColors.yellow,
                      backgroundColor: Colors.white12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('أهلاً بك في ليمونة لايف 🍋',
                style: TextStyle(color: AppColors.yellow, fontSize: 13)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
