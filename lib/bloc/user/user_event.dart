part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserWithPagination extends UserEvent {
  const GetUserWithPagination();
}

class SelectUser extends UserEvent {
  const SelectUser(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class RefreshUser extends UserEvent {
  const RefreshUser();
}
