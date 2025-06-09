import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateBlogUseCase{
  final BlogRepository blogRepository;
  UpdateBlogUseCase({required this.blogRepository});
  Future<Either<Failuress,void>>call(BlogEntity entity)async{
    return blogRepository.updateBlog(entity);
  }
}