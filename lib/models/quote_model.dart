import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable(createToJson: false)
class QuoteModel {
  @JsonKey(name: '_id')
  final String id;
  final List<String> tags;
  final String content;
  final String author;
  final int length;
  final String dateAdded;
  final String dateModified;

  const QuoteModel(this.id, this.tags, this.content, this.author, this.length,
      this.dateAdded, this.dateModified);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

}