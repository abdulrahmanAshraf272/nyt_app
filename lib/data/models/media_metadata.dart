import 'package:json_annotation/json_annotation.dart';

part 'media_metadata.g.dart';

@JsonSerializable()
class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);
}
