import 'package:api_bloc/blocs/app_events.dart';
import 'package:api_bloc/blocs/app_states.dart';
import 'package:api_bloc/models/user_model.dart';
import 'package:api_bloc/repos/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo repo;
  UserBloc(this.repo) : super(StateUserLoading()) {
    on<EventUserLoaded>(
      (event, emit) async {
        emit(StateUserLoading());
        try {
          List<UserModel> userlist = await repo.fetchUsers();
          emit(StateUserLoaded(userlist));
        } catch (e) {
          emit(StateUserError(e.toString()));
        }
      },
    );
  }
}
