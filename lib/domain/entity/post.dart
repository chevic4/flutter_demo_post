import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String thumbnail;
  final String title;
  final String ups;
  final String selftext;

  PostEntity(
      {required this.thumbnail,
      required this.title,
      required this.ups,
      required this.selftext});

  @override
  List<Object> get props => [thumbnail, title, ups, selftext];
}
