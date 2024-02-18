import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:checkoutin/repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
final RegisterRepository registerRepository;

  RegisterBloc({required this.registerRepository}) : super(RegisterInitialState()) {
    on<RegisterInitial>(_register);
  }
_register(RegisterInitial event, Emitter emit) async {
try {
  emit(RegisterLoadingState());

  final result = await registerRepository.adduser(
    nama: event.nama,
    nohp: event.nohp,
    alamat: event.alamat,
    email: event.email,
    password: event.password,
  );
emit(RegisterSuccessState(message: result));

await Future.delayed(Duration(seconds: 2));

emit(RegisterInitialState());

} catch (error) {
  emit(RegisterErrorState(error: "Error: $error"));
}
}
}


