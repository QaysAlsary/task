import 'package:task_manager/src/core/error/failures.dart';

import '../entities/post.dart';
import 'package:dartz/dartz.dart';



abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
