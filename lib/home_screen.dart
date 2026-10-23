import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/live_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _header(),
            const SizedBox(height: 16),
            _banner(),
            const SizedBox(height: 20),
            _quickActions(),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('البثوث الموصى بها',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text('المزيد ›', style: TextStyle(color: AppColors.yellow)),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.78,
              children: const [
                LiveCard(
                    name: 'سارة 💗',
                    subtitle: 'دردشة وترفيه',
                    viewers: '12.4K',
                    colors: [Color(0xFF5B2A86), Color(0xFF1A0F2B)]),
                LiveCard(
                    name: 'علي 🎵',
                    subtitle: 'أغاني وضحك',
                    viewers: '8.7K',
                    colors: [Color(0xFF1F3C88), Color(0xFF0D1530)]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _header() => Row(
        children: [
          const Text('🍋', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 6),
          const Text('ليمونة',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.yellow)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ],
      );

  Widget _banner() => Container(
        height: 150,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xFF2B1B4A), Color(0xFF0F0F1A)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('بثوث مميزة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('اكتشف أجمل اللحظات',
                style: TextStyle(color: AppColors.grey)),
            const SizedBox(height: 12),
            FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  foregroundColor: Colors.black),
              onPressed: () {},
              child: const Text('ادخل الآن'),
            ),
          ],
        ),
      );

  Widget _quickActions() {
    final items = [
      (Icons.videocam, 'مباشر', Colors.redAccent),
      (Icons.groups, 'غرف جماعية', Colors.deepPurpleAccent),
      (Icons.star, 'مواهب', Colors.orangeAccent),
      (Icons.person_add, 'أصدقاء', Colors.blueAccent),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final i in items)
          Column(children: [
            CircleAvatar(
                radius: 28,
                backgroundColor: i.$3,
                child: Icon(i.$1, color: Colors.white)),
            const SizedBox(height: 6),
            Text(i.$2, style: const TextStyle(fontSize: 12)),
          ]),
      ],
    );
  }

  Widget _bottomBar() {
    Widget item(IconData icon, String label, int i) => InkWell(
          onTap: () => setState(() => _tab = i),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, color: _tab == i ? AppColors.yellow : AppColors.grey),
            Text(label,
                style: TextStyle(
                    fontSize: 11,
                    color: _tab == i ? AppColors.yellow : AppColors.grey)),
          ]),
        );
    return Container(
      color: AppColors.card,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item(Icons.home, 'الرئيسية', 0),
            item(Icons.search, 'استكشاف', 1),
            const CircleAvatar(
                backgroundColor: AppColors.yellow,
                child: Icon(Icons.add, color: Colors.black)),
            item(Icons.chat_bubble_outline, 'الرسائل', 3),
            item(Icons.person_outline, 'الملف الشخصي', 4),
          ],
        ),
      ),
    );
  }
}
