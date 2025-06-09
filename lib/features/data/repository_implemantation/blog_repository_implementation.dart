import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/data/source/blog_data_source.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/domain/repository/blog_repository.dart';
import 'package:fpdart/src/either.dart';

class BlogRepositoryImplementation extends BlogRepository{
  final BlogDataSource dataSource;
  BlogRepositoryImplementation({required this.dataSource});
  @override
  Future<Either<Failuress, BlogEntity>> add(BlogEntity entity)async{
    try{
      final data = await dataSource.add(entity);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, List<BlogEntity>>> get()async{
    try{
      final data = await dataSource.get();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>> deleteBlog(String id)async{
    try{
      final data = await dataSource.deleteBlog(id);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, List<BlogEntity>>> searchBlog({required String title})async{
    try{
      final data = await dataSource.searchBlog(title);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress,void>> updateBlog(BlogEntity entity)async{
    try{
      final data = await dataSource.updateBlog(entity);
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}