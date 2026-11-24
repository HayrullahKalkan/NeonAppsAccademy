
import 'package:flutter/material.dart';
import '../../../widgets/iron_man_label.dart';

class IronManScrollScreen extends StatefulWidget {
  const IronManScrollScreen({super.key});

  @override
  State<IronManScrollScreen> createState() =>
      _IronManScrollScreenState();
}

class _IronManScrollScreenState
    extends State<IronManScrollScreen> {

  final ScrollController scrollController = ScrollController();

  bool hasShownAlert = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(checkScrollPosition);
  }

  void checkScrollPosition() {
    if (!scrollController.hasClients || hasShownAlert) {
      return;
    }

    if (scrollController.position.extentAfter <= 0) {
      hasShownAlert = true;
      showEndAlert();
    }
  }

  Future<void> showEndAlert() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Iron Man Alert'),
          content: const Text(
            'You have reached the end of the scroll view.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(checkScrollPosition);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iron Man ScrollView'),
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double labelHeight =
              constraints.maxHeight / 4;

          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: List.generate(8, (index) {
                return IronManLabel(
                  title: 'Label ${index + 1}',
                  height: labelHeight,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
