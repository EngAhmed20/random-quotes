import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String content;
  final String id;

  const Quote(
      {required this.author,
      required this.content,
      required this.id,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [author, content, id, ];
}
