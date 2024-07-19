part of 'buscacep_bloc.dart';

abstract class BuscacepStateBloc extends Equatable {
  
}

class InitialBuscaCepState extends BuscacepStateBloc {
  @override
  List<Object> get props => [];
}

class LoadingBuscaCepState extends BuscacepStateBloc {

  @override
  List<Object> get props => [];
}

class LoadedBuscaCepState extends BuscacepStateBloc{

final CepModel cepModel;
  
    LoadedBuscaCepState(this.cepModel);
  
    @override
    List<Object> get props => [cepModel];

}

class ErrorBuscaCepState extends BuscacepStateBloc{
  
    final String message;
    
      ErrorBuscaCepState(this.message);
    
      @override
      List<Object> get props => [message];
}