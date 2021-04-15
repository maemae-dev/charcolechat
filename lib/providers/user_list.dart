import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userList = StateNotifierProvider.autoDispose<UserList, List<User>>(
    (ref) => UserList(ref.watch(userRepository)));

class UserList extends StateNotifier<List<User>> {
  UserList(this._repository) : super([]) {
    _repository.list()?.listen((users) {
      if (mounted) state = users ?? [];
    });
  }
  final UserRepository _repository;

  User sender(String senderId) =>
      state.singleWhere((user) => user.id == senderId);
}
