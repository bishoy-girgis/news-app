class SourceModel {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceModel({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  SourceModel.fromJson(Map<String, dynamic> json) : this (
    status: json["status"],
    code: json["code"] ?? "",
    message: json["message"] ?? "",
    sources:,);

}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,});

  Source.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: json["category"],);
}
