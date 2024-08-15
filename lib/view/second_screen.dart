import 'package:flutter/material.dart';
import 'package:suitmedia_test/view/first_screen.dart';
import 'package:suitmedia_test/view/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: Border(bottom: BorderSide(color: Colors.grey.withAlpha(50))),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF554AF0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Second Screen',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 13),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 150),
                  Center(
                    child: Text(
                      'Selected User Name',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: CustomTextButton(
                  'Choose a User',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThirdScreen()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
