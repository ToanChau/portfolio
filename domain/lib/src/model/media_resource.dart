import '../extension/extension.dart';
import 'media_formats_model.dart';

class MediaResourceModel {
  final int? id;
  final String? name;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final MediaFormatsModel? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final num? size;
  final String? url;
  final String? previewUrl;
  final String? provider;
  final String? createdAt;
  final String? updatedAt;

  MediaResourceModel({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {return{
    'id':id,
    'name':name,
    'alternativeText':alternativeText,
    'caption':caption,
    'witdh':width,
    'height':height,
    'format': formats?.toJson(),
    'hash':hash,
    'ext':ext,
    'mine':mime,
    'size':size,
    'url': url,
    'previewUrl':previewUrl,
    'provider':provider,
    'createdAt':createdAt,
    'updatedAt':updatedAt
  };}

  factory MediaResourceModel.fromJson(Map<String, dynamic> json) {
    return MediaResourceModel(
        id: json.safeGet<int>('id'),
        name: json.safeGet<String>('name'),
        alternativeText: json.safeGet<String>('alternativeText'),
        caption: json.safeGet<String>('caption'),
        width: json.safeGet<int>('width'),
        height: json.safeGet<int>('height'),
        formats: json['formats'] != null
            ? MediaFormatsModel.fromJson(json['formats'])
            : null,
        hash: json.safeGet<String>('hash'),
        ext: json.safeGet<String>('ext'),
        mime: json.safeGet<String>('mime'),
        size: json.safeGet<int>('size'),
        url: json.safeGet<String>('url'),
        previewUrl: json.safeGet<String>('previewUrl'),
        provider: json.safeGet<String>('provider'),
        createdAt: json.safeGet<String>('created_at'),
        updatedAt: json.safeGet<String>('updated_at'));
  }
}
