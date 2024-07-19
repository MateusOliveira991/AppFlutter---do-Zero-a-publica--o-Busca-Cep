import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_buscaenderecoporcep/models/cep_model.dart';
import 'package:your_app_buscaenderecoporcep/services/cep_service.dart';

part 'buscacep_event_bloc.dart';
part 'buscacep_state_bloc.dart';

class BuscacepBloc extends Bloc<BuscacepEventBloc, BuscacepStateBloc> {
  final CepService cepService;
  BuscacepBloc(this.cepService) : super(InitialBuscaCepState()) {
    on<BuscaCepEvent>(_onBuscaCep);
  }

  

  FutureOr<void> _onBuscaCep(BuscaCepEvent event, Emitter<BuscacepStateBloc> emit) {
    emit(LoadingBuscaCepState());
    
  }
}