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

  factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
      status: json["status"],
      code: json["code"] ?? "",
      message: json["message"] ?? "",
      sources:List<Source>.from(json["sources"].map((e) =>Source.fromJson(e))),
    );
  }

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
    this.category,
  });

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
    );
  }
}
