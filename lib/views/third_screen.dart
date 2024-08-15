import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
          'Third Screen',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListUserItem(
            avatarUrl: '',
            name: 'John Doe',
            email: 'johndoe@gmail.com',
            onTap: () {},
          );
        },
        itemCount: 20,
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const SizedBox(height: 15),
      //       ListUserItem(
      //         avatarUrl: '',
      //         name: 'John Doe',
      //         email: 'johndoe@gmail.com',
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class ListUserItem extends StatelessWidget {
  const ListUserItem({
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.onTap,
    super.key,
  });

  final String avatarUrl;
  final String name;
  final String email;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide.none,
            bottom: BorderSide(
              color: Color(0xffE2E3E4),
            ),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 32),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  email,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
