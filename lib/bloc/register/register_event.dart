part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {}

final class RegisterInitial extends RegisterEvent {
final String nama;
final String nohp;
final String alamat;
final String email;
final String password;

RegisterInitial({required this.nama, required this.nohp, required this.alamat, required this.email, required this.password});
@override
List<Object> get props => [nama, nohp, alamat, email, password];

}