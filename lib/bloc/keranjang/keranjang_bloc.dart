import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'keranjang_event.dart';
part 'keranjang_state.dart';

class KeranjangBloc extends Bloc<KeranjangEvent, KeranjangState> {
  KeranjangBloc() : super(KeranjangInitial()) {
    on<KeranjangEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
