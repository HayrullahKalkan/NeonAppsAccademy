import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QueenScreen extends StatefulWidget {
  const QueenScreen({super.key});

  @override
  State<QueenScreen> createState() => _QueenScreenState();
}

class _QueenScreenState extends State<QueenScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Queen's Challenge"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name-Surname',
                  hintText: 'Enter Name-Surname',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Invalid email format';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                style: const TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.green,
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }

                  if (value.length != 10) {
                    return 'Phone number must be 10 digits';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form submitted successfully!'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
