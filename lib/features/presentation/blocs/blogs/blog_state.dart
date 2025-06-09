part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}
final class BlogLoading extends BlogState{}
final class BlogError extends BlogState{
  final String error;
  BlogError({required this.error});
}
final class BlogGetState extends BlogState{
  final List<BlogEntity> entity;
  BlogGetState({required this.entity});
}
final class BlogAddState extends BlogState{
  final BlogEntity entity;
  BlogAddState({required this.entity});
}
final class SearchBlogState extends BlogState{
  final List<BlogEntity>entity;
  SearchBlogState({required this.entity});
}
final class UpdateBlogState extends BlogState{
  // final BlogEntity entity;
  // UpdateBlogState({required this.entity});
}
final class DeleteBlogState extends BlogState{
}