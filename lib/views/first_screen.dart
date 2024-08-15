import 'package:flutter/material.dart';
import 'package:suitmedia_test/views/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final firstTextController = TextEditingController();
  final secondTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 51),
                    Image.asset(
                      'assets/images/person_add.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 51),
                    CustomTextField(
                      hintText: "Name",
                      controller: firstTextController,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      hintText: "Palindrome",
                      controller: secondTextController,
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                        'CHECK',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                        'NEXT',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const SecondScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
    this.text, {
    super.key,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF2B637B),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0.5,
            color: Color(0xFFE2E3E4),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7.94,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0.5,
            color: Color(0xFFE2E3E4),
          ),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF6867775C),
            ),
      ),
    );
  }
}
