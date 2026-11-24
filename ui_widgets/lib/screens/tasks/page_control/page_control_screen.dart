import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

import '../../../data/page_data.dart';

class PageControlScreen extends StatefulWidget {
  const PageControlScreen({super.key});

  @override
  State<PageControlScreen> createState() => _PageControlScreenState();
}

class _PageControlScreenState extends State<PageControlScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pages[currentPage].backgroundColor,
      appBar: CustomAppBar(
        title: 'Page Control',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final page = pages[index];

                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page.imagePath,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        page.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        page.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              final isActive = currentPage == index;

              return GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.all(5),
                  width: isActive ? 24 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.deepPurple : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
