part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  UserState({
    this.status = UserStatus.initial,
    this.users = const <User>[],
    this.reachedMax = false,
    this.errorMessage = '',
    this.selectedUsername,
  }) : assert(status == UserStatus.failure ? errorMessage.isNotEmpty : true);

  final UserStatus status;
  final List<User> users;
  final bool reachedMax;
  final String errorMessage;
  final String? selectedUsername;

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
    bool? reachedMax,
    String? errorMessage,
    String? selectedUsername,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      reachedMax: reachedMax ?? this.reachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedUsername: selectedUsername ?? this.selectedUsername,
    );
  }

  @override
  List<Object?> get props => [
        status,
        users,
        reachedMax,
        selectedUsername,
      ];
}
