// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      id: (json['id'] as num?)?.toInt(),
      assetId: (json['asset_id'] as num?)?.toInt(),
      source: json['source'] as String?,
      publishedDate: json['published_date'] as String?,
      updated: json['updated'] as String?,
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      nytdsection: json['nytdsection'] as String?,
      adxKeywords: json['adx_keywords'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      abstractText: json['abstract'] as String?,
      desFacet: (json['des_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['org_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['per_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: (json['geo_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      etaId: (json['eta_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'uri': instance.uri,
      'url': instance.url,
      'id': instance.id,
      'asset_id': instance.assetId,
      'source': instance.source,
      'published_date': instance.publishedDate,
      'updated': instance.updated,
      'section': instance.section,
      'subsection': instance.subsection,
      'nytdsection': instance.nytdsection,
      'adx_keywords': instance.adxKeywords,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'abstract': instance.abstractText,
      'des_facet': instance.desFacet,
      'org_facet': instance.orgFacet,
      'per_facet': instance.perFacet,
      'geo_facet': instance.geoFacet,
      'media': instance.media,
      'eta_id': instance.etaId,
    };
