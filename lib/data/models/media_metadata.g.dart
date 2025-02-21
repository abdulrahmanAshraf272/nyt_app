// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMetadata _$MediaMetadataFromJson(Map<String, dynamic> json) =>
    MediaMetadata(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MediaMetadataToJson(MediaMetadata instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };
