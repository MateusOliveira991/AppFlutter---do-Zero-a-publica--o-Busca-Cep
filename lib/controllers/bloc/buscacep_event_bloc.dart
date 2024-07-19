part of 'buscacep_bloc.dart';



abstract class BuscacepEventBloc extends Equatable {
 
}

class BuscaCepEvent extends BuscacepEventBloc {
  final String cep;

  BuscaCepEvent(this.cep);

  @override
  List<Object> get props => [cep];
}