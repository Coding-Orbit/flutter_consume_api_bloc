import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api_bloc/features/quotes/bloc/quote_bloc.dart';
import 'package:flutter_consume_api_bloc/features/quotes/bloc/quote_event.dart';
import 'package:flutter_consume_api_bloc/features/quotes/bloc/quote_state.dart';
import 'package:flutter_consume_api_bloc/features/quotes/repository/quote_repository.dart';
import 'package:flutter_consume_api_bloc/features/quotes/ui/widgets/quote_widget.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Quotes'),
        centerTitle: true,
      ),
      body: BlocProvider<QuoteBloc>(
        create: (context) =>
            QuoteBloc(RepositoryProvider.of<QuotesRepository>(context))
              ..add(LoadQuoteEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
              if (state is QuoteErrorState) {
                return Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                );
              } else if (state is QuoteLoadedState) {
                return QuoteWidget(
                    model: state.model,
                    onPressed: () =>
                        context.read<QuoteBloc>().add(LoadQuoteEvent()));
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
