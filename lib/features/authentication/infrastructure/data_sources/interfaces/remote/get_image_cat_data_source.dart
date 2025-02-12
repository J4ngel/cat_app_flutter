import 'package:cat_app_flutter/features/authentication/infrastructure/models/cat_image_model.dart';

abstract class GetImageCatDataSource {
  Future<CatImageModel> call(String id);
}