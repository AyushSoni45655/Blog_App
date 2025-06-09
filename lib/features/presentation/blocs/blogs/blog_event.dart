part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}
class AddBlogEvent extends BlogEvent{
  final BlogEntity entity;
  AddBlogEvent({required this.entity});
}
class GetBlogEvent extends BlogEvent{}
class SearchBlogEvent extends BlogEvent{
  final String title;
  SearchBlogEvent({required this.title});
}
class DeleteBlogEvent extends BlogEvent{
  final String id;
  DeleteBlogEvent({required this.id});
}
class UpdateBlogEvent extends BlogEvent{
  final BlogEntity entity;
  UpdateBlogEvent({required this.entity});
}