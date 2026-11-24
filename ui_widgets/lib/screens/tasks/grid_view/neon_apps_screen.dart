import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui_widgets/data/neon_app_model.dart';

import '../../../widgets/neon_app_card.dart';
import 'neon_app_detail_screen.dart';

class NeonAppsScreen extends StatefulWidget {
  const NeonAppsScreen({super.key});

  @override
  State<NeonAppsScreen> createState() => _NeonAppsScreenState();
}

class _NeonAppsScreenState extends State<NeonAppsScreen> {
  int? selectedIndex;
  double itemHeight = 210;

  void selectApp(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NeonAppDetailScreen(app: neonApps[index]),
      ),
    );
  }

  Future<void> refreshApps() async {
    // Yerel data kullandığımız için örnek yenileme.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      selectedIndex = null;
    });
  }

  Future<void> shareApp(int index) async {
    final app = neonApps[index];

    final String shareText =
        '''
Check out ${app.appName}!

Category: ${app.appCategory}
Store: ${app.storeURL}
''';

    try {
      await SharePlus.instance.share(
        ShareParams(text: shareText, subject: app.appName),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not share app')));
    }
  }

  void changeItemSize() {
    setState(() {
      itemHeight = itemHeight == 210 ? 250 : 210;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'Neon Apps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Change card size',
            onPressed: changeItemSize,
            icon: const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore Our Apps',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Discover, explore and share your favorites.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: Colors.deepPurple,
              onRefresh: refreshApps,
              child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: neonApps.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  mainAxisExtent: itemHeight,
                ),
                itemBuilder: (context, index) {
                  return NeonAppCard(
                    app: neonApps[index],
                    isSelected: selectedIndex == index,
                    onTap: () => selectApp(index),
                    onShare: () => shareApp(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
