import 'package:api_bloc/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

//Data Loading State

class StateUserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

//Data Loading State

class StateUserLoaded extends UserState {
  final List<UserModel> users;
  StateUserLoaded(this.users);
  @override
  List<Object?> get props => [users];
}

//Data Loading State

class StateUserError extends UserState {
  final String error;
  StateUserError(this.error);

  @override
  List<Object?> get props => [error];
}
