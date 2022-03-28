// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      json['_id'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['content'] as String,
      json['author'] as String,
      json['length'] as int,
      json['dateAdded'] as String,
      json['dateModified'] as String,
    );
