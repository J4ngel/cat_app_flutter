
import 'package:cat_app_flutter/core/network/http/implementations/http_module.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/get_image_cat_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/models/cat_image_model.dart';

final class GetImageCatDataSourceImpl implements GetImageCatDataSource {
  const GetImageCatDataSourceImpl({
    required this.httpModule  
  });
  
  final HttpModule httpModule;
  
  @override
  Future<CatImageModel> call(String id) async {
    final response = await httpModule.get('/v1/images/$id');

    final body = response['body'];

    return CatImageModel.fromMap(body);
  }
}