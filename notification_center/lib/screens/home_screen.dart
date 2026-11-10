import 'package:flutter/material.dart';

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

  String password = "xxxx****";
  int istrue() {
    final key = keyController.text;
    for (int i = 0; i < key.length; i++) {
      if (password[i] != key[i] && password.length == key.length) {
        return 0;
      }
    }
    return 1;
  }

  void decrypt() {
    final result = istrue();

    if (result == 1) {
      //ekran geçişi yapılacak 
    }else{
      //ekrana hata mesajı verilecek 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('abc')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Enter Decryption Key"),
              SizedBox(height: 20),
              TextField(
                controller: keyController,
                decoration: InputDecoration(
                  labelText: 'key',
                  hintText: 'wlksh23',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: null, child: Text("decyrpt")),
            ],
          ),
        ),
      ),
    );
  }
}
