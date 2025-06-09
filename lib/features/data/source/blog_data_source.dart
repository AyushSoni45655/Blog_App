import 'package:blog_app/features/data/entity_modal/blog_modal.dart';
import 'package:blog_app/features/domain/entity/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BlogDataSource{
  Future<BlogModel>add(BlogEntity entity);
  Future<List<BlogModel>>get();
  Future<List<BlogModel>>searchBlog(String title);
  Future<void>updateBlog(BlogEntity entity);
  Future<void>deleteBlog(String id);
}
class BlogDateSourceImplementation extends BlogDataSource{
  final FirebaseFirestore firestore;
  BlogDateSourceImplementation({required this.firestore});
  @override
  Future<BlogModel> add(BlogEntity entity)async{
    final modals = BlogModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        image: entity.image,
        date: entity.date,
        time: entity.time
    );
    await firestore.collection("Blogs").doc(modals.id).set(modals.toMap());
    return modals;
  }

  @override
  Future<List<BlogModel>> get()async{
   final snaps = await firestore.collection("Blogs").get();
   final data = snaps.docs.map((e) => BlogModel.fromJson(e.data()),).toList();
   return data;
  }

  @override
  Future<void> deleteBlog(String id)async{
   await firestore.collection("Blogs").doc(id).delete();
  }

  @override
  Future<List<BlogModel>> searchBlog(String title)async{
    try{
      if(title.trim().isEmpty){
        final data = await firestore.collection("Blogs").get();
        return data.docs.map((e) => BlogModel.fromJson(e.data()),).toList();
      }else{
        final data = await firestore.collection("Blogs").where("Title",isGreaterThanOrEqualTo: title).get();
        return data.docs.map((e) => BlogModel.fromJson(e.data()),).toList();
      }
    }catch(e){
      throw Exception("Search blog failed: $e");
    }

  }

  @override
  Future<void> updateBlog(BlogEntity entity)async{
    final model = BlogModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        image: entity.image,
        date: entity.date,
        time: entity.time
    );
     await firestore.collection("Blogs").doc(model.id).update(model.toMap());
  }

}