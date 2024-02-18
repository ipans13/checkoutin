part of 'profil_bloc.dart';

@immutable
sealed class ProfilEvent extends Equatable{}

final class ProfilInitial extends ProfilEvent {
  List<Object?> get props => [];
}

final class GetProfilEvent extends ProfilEvent {
  List<Object?> get props => [];
}

final class EditProfilEvent extends ProfilEvent {
final String nama;
final String nohp;
final String alamat;


EditProfilEvent({
this.nama = "",
this.nohp = "",
this.alamat = "",
});
  List<Object?> get props => [nama,nohp,alamat];

}
