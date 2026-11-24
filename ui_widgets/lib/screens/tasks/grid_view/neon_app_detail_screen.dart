import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/neon_app_model.dart';

class NeonAppDetailScreen extends StatelessWidget {
  final NeonAppModel app;

  const NeonAppDetailScreen({super.key, required this.app});

  Future<void> openStore(BuildContext context) async {
    final Uri? url = Uri.tryParse(app.storeURL);

    if (url == null ||
        !['http', 'https'].contains(url.scheme) ||
        url.host.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Store URL is not available')),
      );
      return;
    }

    try {
      final bool success = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!success && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open store')));
      }
    } catch (error) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('An error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('App Details'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.asset(
                  app.appIcon,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.apps_rounded,
                      size: 100,
                      color: Colors.deepPurple,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 22),

            Text(
              app.appName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              app.appCategory,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.apps, color: Colors.deepPurple),
                      title: const Text('App Name'),
                      subtitle: Text(app.appName),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.calendar_month,
                        color: Colors.deepPurple,
                      ),
                      title: const Text('Release Date'),
                      subtitle: Text(
                        '${app.releaseDate.day}/'
                        '${app.releaseDate.month}/'
                        '${app.releaseDate.year}',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.category,
                        color: Colors.deepPurple,
                      ),
                      title: const Text('Category'),
                      subtitle: Text(app.appCategory),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.link, color: Colors.deepPurple),
                      title: const Text('Store URL'),
                      subtitle: Text(
                        app.storeURL.isEmpty ? 'Not available' : app.storeURL,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () => openStore(context),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open in App Store'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
