part of 'profil_bloc.dart';

@immutable
sealed class ProfilState extends Equatable {}

final class ProfilInitialState extends ProfilState {
List<Object> get props => [];
}

final class EditInitialState extends ProfilState {
  
List<Object> get props => [];
}

class ProfilLoadingState extends ProfilState {
  List<Object> get props => [];
}

class EditProfilState extends ProfilState {
  final String message;

  EditProfilState({required this.message});
  List<Object> get props => [];
}

class ProfilLoadState extends ProfilState {
  final Map info;

  ProfilLoadState({required this.info});
  List<Object> get props => [info];
}

class EditSuccessState extends ProfilState {
  final String message;

  EditSuccessState({required this.message});
  List<Object> get props => [];
}
class ProfilErrorState extends ProfilState {
  final String error;

  ProfilErrorState({required this.error});
  List<Object> get props => [];
}
