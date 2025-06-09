import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract class BlogRepository{
  Future<Either<Failuress,BlogEntity>>add(BlogEntity entity);
  Future<Either<Failuress,List<BlogEntity>>>get();
  //FOR THE SEARCH BLOG ON THE BASIS OF THE TITLES
Future<Either<Failuress,List<BlogEntity>>>searchBlog({required String title});
// FOR THE UPDATE THE BLOG
Future<Either<Failuress,void>>updateBlog(BlogEntity entity);
//FOR THE DELETE THE BLOG
Future<Either<Failuress,void>>deleteBlog(String id);
}