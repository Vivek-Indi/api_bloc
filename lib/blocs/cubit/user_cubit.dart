import 'package:api_bloc/blocs/cubit/user_state.dart';
import 'package:api_bloc/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo repo;
  UserCubit(this.repo) : super(StateUserLoading());
 // emit(StateUserLoading());

  void getData() async {
    try {
   //   emit(StateUserLoading());
      List<UserModel> users = await repo.fetchUsers();
      emit(StateUserLoaded(users));
    } catch (e) {
      emit(StateUserError(e.toString()));
    }
  }
}
