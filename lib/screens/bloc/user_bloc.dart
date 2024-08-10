import 'package:flutter/material.dart';
import 'package:test_biiscorp/model/remote_datasource.dart';
import 'package:test_biiscorp/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource remoteDataSource;
  UserBloc({required this.remoteDataSource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await remoteDataSource.getUsers();
        emit(UserLoaded(users: result.data));
      } catch (e) {
        emit(UserError(error: e.toString()));
      }
    });
  }
}
