import 'package:task_manager/src/core/error/failures.dart';

import '../repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';


import '../entities/post.dart';

class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
