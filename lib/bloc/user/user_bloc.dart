import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:suitmedia_test/model/user.dart';
import 'package:suitmedia_test/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  List<User> currentUsers = [];
  int page = 1;

  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserState()) {
    on<GetUserWithPagination>(_onGetUser);
    on<RefreshUser>(_onRefreshUser);
    on<SelectUser>(_onSelectUser);
  }

  void _onSelectUser(SelectUser event, Emitter<UserState> emit) {
    emit(state.copyWith(selectedUsername: event.name));
  }

  void _onRefreshUser(RefreshUser event, Emitter<UserState> emit) async {
    page = 1;

    emit(state.copyWith(
      status: UserStatus.loading,
      users: [],
      reachedMax: false,
    ));

    final users = await _fetchUser();

    if (users == null) {
      return emit(state.copyWith(
        status: UserStatus.failure,
        errorMessage: 'Failed to get users',
      ));
    }

    emit(state.copyWith(
      status: UserStatus.success,
      users: users,
      reachedMax: users.isEmpty,
    ));
  }

  // continuous scroll
  void _onGetUser(GetUserWithPagination event, Emitter<UserState> emit) async {
    if (state.reachedMax) return;

    try {
      if (state.status == UserStatus.initial) {
        emit(state.copyWith(status: UserStatus.loading));
        final users = await _fetchUser();

        if (users == null) {
          return emit(state.copyWith(
            status: UserStatus.failure,
            errorMessage: 'Failed to get users',
          ));
        }

        return emit(state.copyWith(
          status: UserStatus.success,
          users: users,
          reachedMax: users.isEmpty,
        ));
      }

      final users = await _fetchUser();

      if (users == null) {
        return emit(state.copyWith(
          status: UserStatus.failure,
          errorMessage: 'Failed to get users',
        ));
      }

      return emit(state.copyWith(
        status: UserStatus.success,
        users: [...state.users, ...users],
        reachedMax: users.isEmpty,
      ));
    } catch (e) {
      debugPrint('error: $e');
      emit(state.copyWith(
        status: UserStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<List<User>?> _fetchUser() async {
    final users = await _userRepository.getUsers(page);
    page++;
    return users;
  }
}
