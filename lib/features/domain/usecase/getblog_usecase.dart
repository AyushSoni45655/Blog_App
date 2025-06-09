import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetBlogUseCase{
  final BlogRepository blogRepository;
  GetBlogUseCase({required this.blogRepository});
  Future<Either<Failuress,List<BlogEntity>>>call()async{
    return blogRepository.get();
  }
}