import 'package:flutter/material.dart';

class MutationPage extends StatefulWidget {
  const MutationPage({super.key});

  @override
  State<MutationPage> createState() => _MutationPageState();
}

class _MutationPageState extends State<MutationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mutation"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter Name"),
                hintText: 'Enter Name',),
            ),
          ],
        ),
      ),
    );
  }
}
