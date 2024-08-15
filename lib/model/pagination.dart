import 'package:equatable/equatable.dart';
import 'package:suitmedia_test/model/base_model.dart';

class Pagination<T extends BaseModel> extends Equatable {
  const Pagination({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<T>? data;

  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return Pagination(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data: json["data"] == null
          ? []
          : List<T>.from(json["data"]!.map((x) => fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data?.map((x) => x.toJson()).toList() ?? [],
      };

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
      ];
}
