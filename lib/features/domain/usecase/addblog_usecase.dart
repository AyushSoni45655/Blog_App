import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddBlogUseCase{
  final BlogRepository blogRepository;
  AddBlogUseCase({required this.blogRepository});
  Future<Either<Failuress,BlogEntity>>call(BlogEntity entity)async{
    return blogRepository.add(entity);
  }
}