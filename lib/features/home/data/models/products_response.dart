import 'dart:convert';

import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  int? results;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "data")
  List<ProductDto>? data;

  ProductsResponse({this.results, this.metadata, this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;
  @JsonKey(name: "nextPage")
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
