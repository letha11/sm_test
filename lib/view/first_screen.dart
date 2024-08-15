import 'package:flutter/material.dart';
import 'package:suitmedia_test/helper/palindrome_check.dart';
import 'package:suitmedia_test/view/second_screen.dart';
import 'package:suitmedia_test/view/widget/custom_text_button.dart';
import 'package:suitmedia_test/view/widget/custom_textfield.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final firstTextController = TextEditingController();
  final secondTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
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
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
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
                        validator: (p0) {
                          return p0!.isEmpty ? 'Name cannot be empty' : null;
                        },
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
                          onPressed: () =>
                              checkPalindrome(secondTextController.text),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: CustomTextButton(
                          'NEXT',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SecondScreen(
                                    name: firstTextController.text,
                                  );
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
      ),
    );
  }

  void checkPalindrome(String text) {
    final bool isPalindrome = palindromeCheck(text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isPalindrome ? 'isPalindrome' : "not palindrome",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Text(
          isPalindrome ? 'This is a palindrome' : 'This is not a palindrome',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
