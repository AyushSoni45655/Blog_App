import 'package:bloc/bloc.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:blog_app/features/domain/usecase/addblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/deleteblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/getblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/searchblog_usecase.dart';
import 'package:blog_app/features/domain/usecase/updateblo_usecase.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final AddBlogUseCase addBlogUseCase;
  final GetBlogUseCase getBlogUseCase;
  final SearchBlogUseCase searchBlogUseCase;
  final UpdateBlogUseCase updateBlogUseCase;
  final DeleteBlogUseCse deleteBlogUseCse;
  BlogBloc({required this.getBlogUseCase,
    required this.addBlogUseCase,
    required this.deleteBlogUseCse,
    required this.updateBlogUseCase,
    required this.searchBlogUseCase
  }) : super(BlogInitial()) {
    on<AddBlogEvent>((event, emit)async{
      emit(BlogLoading());
      final data = await addBlogUseCase.call(event.entity);
      data.fold((l) {
        print("❌ Failure in addBlog: ${l.toString()}");
        emit(BlogError(error: l.error));
        },(r) {
        print("✅ Blog Added Successfully");
        emit(BlogAddState(entity: r));},);
    });
    on<GetBlogEvent>((event, emit)async{
      emit(BlogLoading());
      final data = await getBlogUseCase.call();
      data.fold((l) => emit(BlogError(error: l.toString())),(r) => emit(BlogGetState(entity: r)),);
    });
    on<SearchBlogEvent>((event, emit)async{
      emit(BlogLoading());
      final data = await searchBlogUseCase.call(event.title);
      data.fold((l) => emit(BlogError(error: l.toString())),(r) => emit(SearchBlogState(entity: r)),);
    });
    on<UpdateBlogEvent>((event, emit)async{
      emit(BlogLoading());
      final data = await updateBlogUseCase.call(event.entity);
      data.fold((l) => emit(BlogError(error: l.toString())),(_) => emit(UpdateBlogState()),);
    });
    on<DeleteBlogEvent>((event, emit)async{
      emit(BlogLoading());
      final data = await deleteBlogUseCse.call(event.id);
      data.fold((l) => emit(BlogError(error: l.toString())),(_) => emit(DeleteBlogState()),);
    });
  }
}
