import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api_bloc/features/quotes/repository/quote_repository.dart';
import 'package:flutter_consume_api_bloc/features/quotes/ui/quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => QuotesRepository(),
      child: const MaterialApp(
        home: QuoteScreen(),
      ),
    );
  }
}

