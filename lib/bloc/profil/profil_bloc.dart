import 'package:bloc/bloc.dart';
import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:checkoutin/repository/repository.dart';
import 'package:checkoutin/repository/login_repository.dart';

part 'profil_event.dart';
part 'profil_state.dart';

class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  final LoginRepository loginRepository;

  ProfilBloc({required this.loginRepository}) : super(ProfilInitialState()) {
    on<GetProfilEvent>(_loadProfil);
    on<EditProfilEvent>(_editProfil);
  }
  _loadProfil(GetProfilEvent event, Emitter emit) async{

    Map res = await loginRepository.getInfoUser();

       if (res['success'] == true) {
     emit(ProfilLoadState(info: res));
   } else{
    emit(ProdukErrorState(error: "Error"));
   }
  }
  _editProfil(EditProfilEvent event, Emitter emit)async{
try {
  emit(ProfilLoadingState());


  Map result = await loginRepository.editUser(
    nama: event.nama,
    nohp: event.nohp,
    alamat: event.alamat,
  );
if (result['success'] == true) {
emit(EditSuccessState(message: result['message']));  
}else{
  emit(ProfilErrorState(error: "Error: $result['message']"));
}
} catch (error) {
  emit(ProfilErrorState(error: "Error: $error"));
}
  }
}
