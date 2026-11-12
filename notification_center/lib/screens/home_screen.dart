import 'package:flutter/material.dart';
import 'package:notification_center/screens/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keyController = TextEditingController();

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  String password = "12345";

  int istrue() {
    final key = keyController.text;

    if (key.isEmpty || key.length != password.length) {
      return 0;
    }

    for (int i = 0; i < key.length; i++) {
      if (password[i] != key[i]) {
        return 0;
      }
    }

    return 1;
  }

  void decrypt() {
    final result = istrue();

    if (result == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WaitingScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Wrong decryption key!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0B1220);
    const cardColor = Color(0xFF162235);
    const neonGreen = Color(0xFF00E676);

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: cardColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "CLASSIFIED ACCESS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 16,
          ),
        ),
        leading: const Icon(Icons.add_moderator, color: neonGreen),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Security icon
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cardColor,
                    border: Border.all(color: neonGreen, width: 2),
                  ),
                  child: const Icon(Icons.shield, size: 65, color: neonGreen),
                ),

                const SizedBox(height: 30),

                // Main title
                const Text(
                  "TOP SECRET",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Secure Decryption Terminal",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 45),

                // Input card
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white12),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ENTER DECRYPTION KEY",
                        style: TextStyle(
                          color: neonGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: keyController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 4,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your key",
                          hintStyle: const TextStyle(color: Colors.white38),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: neonGreen,
                          ),
                          filled: true,
                          fillColor: backgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white24),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: neonGreen,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Decrypt button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: decrypt,
                          icon: const Icon(Icons.vpn_key),
                          label: const Text(
                            "DECRYPT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: neonGreen,
                            foregroundColor: backgroundColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // Footer
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white38,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "AUTHORIZED PERSONNEL ONLY",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  "SECURE CONNECTION • ENCRYPTED",
                  style: TextStyle(
                    color: neonGreen,
                    fontSize: 9,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
