import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteBlogUseCse{
  final BlogRepository blogRepository;
  DeleteBlogUseCse({required this.blogRepository});
  Future<Either<Failuress,void>>call(String id)async{
    return blogRepository.deleteBlog(id);
  }
}