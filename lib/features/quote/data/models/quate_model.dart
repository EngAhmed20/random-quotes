import 'package:quotes_clean/features/quote/domain/entities/quote.dart';

class QuoteModel extends Quote{
  const QuoteModel({required super.author, required super.content, required super.id,});
  factory QuoteModel.fromJson(Map<String,dynamic>json)=>QuoteModel(
      author: json['author'],
      content: json['content'],
      id: json['_id'],
  );
  Map <String,dynamic> toJson()=>{
    'author': author,
    'content': content,
    '_id': id,
  };
}