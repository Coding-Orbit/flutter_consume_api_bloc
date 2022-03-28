import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api_bloc/features/quotes/bloc/quote_event.dart';
import 'package:flutter_consume_api_bloc/features/quotes/bloc/quote_state.dart';
import 'package:flutter_consume_api_bloc/features/quotes/repository/quote_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuotesRepository _repository;

  QuoteBloc(this._repository) : super(QuoteLoadingState()) {
    on<LoadQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());
      try{
        final model = await _repository.getQuote();
        emit(QuoteLoadedState(model));
      }catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }
}