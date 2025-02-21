import 'package:json_annotation/json_annotation.dart';

import 'media.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  String? uri;
  String? url;
  int? id;
  @JsonKey(name: 'asset_id')
  int? assetId;
  String? source;
  @JsonKey(name: 'published_date')
  String? publishedDate;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  @JsonKey(name: 'adx_keywords')
  String? adxKeywords;
  String? byline;
  String? type;
  String? title;
  @JsonKey(name: 'abstract')
  String? abstractText;
  @JsonKey(name: 'des_facet')
  List<String>? desFacet;
  @JsonKey(name: 'org_facet')
  List<String>? orgFacet;
  @JsonKey(name: 'per_facet')
  List<String>? perFacet;
  @JsonKey(name: 'geo_facet')
  List<String>? geoFacet;
  List<Media>? media;
  @JsonKey(name: 'eta_id')
  int? etaId;

  Article({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.byline,
    this.type,
    this.title,
    this.abstractText,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
