import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

//Data Loading State

class EventUserLoaded extends UserEvent {
  @override
  List<Object?> get props => [];
}
