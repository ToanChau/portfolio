import '../extension/extension.dart';

class MediaFormatModel {
  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final String? path;
  final num? sizeInBytes;
  final num? width;
  final num? height;

  MediaFormatModel({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.sizeInBytes,
    this.width,
    this.height,
  });

  factory MediaFormatModel.fromJson(Map<String, dynamic> json) {
    return MediaFormatModel(
      ext: json.safeGet<String>('ext'),
      url: json.safeGet<String>('url'),
      hash: json.safeGet<String>('hash'),
      mime: json.safeGet<String>('mime'),
      name: json.safeGet<String>('name'),
      path: json.safeGet<String>('path'),
      sizeInBytes: json.safeGet<num>('sizeInBytes'),
      width: json.safeGet<num>('width'),
      height: json.safeGet<num>('height'),
    );
  }
}
