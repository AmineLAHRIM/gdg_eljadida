import 'package:equatable/equatable.dart';

class Event extends Equatable {
  String id;
  String name;
  String imageUrl;
  bool isFavorite;

  Event({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;
}
