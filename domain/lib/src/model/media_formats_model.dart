import 'media_format.dart';

class MediaFormatsModel {
  final MediaFormatModel? large;
  final MediaFormatModel? small;
  final MediaFormatModel? medium;
  final MediaFormatModel? thumbnail;

  MediaFormatsModel({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
    
  };

  factory MediaFormatsModel.fromJson(Map<String, dynamic> json) {
    return MediaFormatsModel(
      large: (json['large'] != null)
          ? MediaFormatModel.fromJson(json['large'])
          : null,
      small: (json['small'] != null)
          ? MediaFormatModel.fromJson(json['small'])
          : null,
      medium: (json['medium'] != null)
          ? MediaFormatModel.fromJson(json['medium'])
          : null,
      thumbnail: (json['thumbnail'] != null)
          ? MediaFormatModel.fromJson(json['thumbnail'])
          : null,
    );
  }
}
