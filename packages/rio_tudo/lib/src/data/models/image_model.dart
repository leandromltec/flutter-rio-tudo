import '../../domain/entities/entities.dart';

class ImageModel {
  String? titleImage;
  String? urlImage;

  ImageModel({this.titleImage, this.urlImage});

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(titleImage: map['titleImage'], urlImage: map['urlImage']);
  }

  ImageEntity toEntity() =>
      ImageEntity(titleImage: titleImage, urlImage: urlImage);
}
