part of 'check_bloc.dart';

abstract class CheckState {}

class CheckInitial extends CheckState {}

class CheckLoading extends CheckState {}

class CheckSuccess extends CheckState {
  final List<CheckModel> checkList;

  CheckSuccess(this.checkList);
}

class CheckFailure extends CheckState {
  final String errorMessage;

  CheckFailure(this.errorMessage);
}
