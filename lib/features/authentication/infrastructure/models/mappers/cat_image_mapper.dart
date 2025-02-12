import 'package:cat_app_flutter/features/authentication/domain/entities/cat_image_entity.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/models/cat_image_model.dart';

abstract class CatImageMapper {
  static CatImageEntity mapToEntity(CatImageModel model){
    return CatImageEntity(id: model.id, url: model.url);
  }
}