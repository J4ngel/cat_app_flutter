import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/cat_image_entity.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/cat_image_repository.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/get_image_cat_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/models/mappers/cat_image_mapper.dart';
import 'package:dartz/dartz.dart';

final class CatImageGateway implements CatImageRepository{
  CatImageGateway({required this.getImageCatDataSource});

  final GetImageCatDataSource getImageCatDataSource;

  @override
  Future<Either<CatImageEntity, Failure>> getImage(String id) async {
    final resolve = await getImageCatDataSource.call(id);

    return Left(CatImageMapper.mapToEntity(resolve));
  }
}