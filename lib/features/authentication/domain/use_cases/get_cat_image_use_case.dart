import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/cat_image_entity.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/cat_image_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatImageUseCase{
  GetCatImageUseCase({required this.catImageRepository});

  final CatImageRepository catImageRepository;

  Future<Either<CatImageEntity, Failure>> call(String id) async {
    final result = catImageRepository.getImage(id);
    return result;
  }
}