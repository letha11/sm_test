import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/bloc/user/user_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetUserWithPagination());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 50 &&
          !isFetching) {
        isFetching = true;
        context.read<UserBloc>().add(const GetUserWithPagination());
      }
    });
  }

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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == UserStatus.loading && state.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == UserStatus.failure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else if (state.status == UserStatus.success) {
            if (state.users.isEmpty) {
              return const Center(
                child: Text('No users found'),
              );
            } else if (!state.reachedMax) {
              isFetching = false;
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserBloc>().add(const RefreshUser());
              },
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, i) {
                  if (i == state.users.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return ListUserItem(
                    avatarUrl: state.users[i].avatar,
                    name:
                        '${state.users[i].firstName} ${state.users[i].lastName}',
                    email: state.users[i].email,
                    onTap: () {
                      context.read<UserBloc>().add(SelectUser(
                          '${state.users[i].firstName} ${state.users[i].lastName}'));
                    },
                  );
                },
                itemCount: state.reachedMax
                    ? state.users.length
                    : state.users.length + 1,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
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
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(avatarUrl),
            ),
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
