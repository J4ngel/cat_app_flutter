import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/cat_image_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CatImageRepository {
  Future<Either<CatImageEntity, Failure>> getImage(String id);
}