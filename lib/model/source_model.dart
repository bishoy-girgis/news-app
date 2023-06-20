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

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      status: json["status"],
      code: json["code"] ?? "",
      message: json["message"] ?? "",
      sources:
          List<Source>.from(json["sources"].map((e) => Source.fromJson(e))),
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

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
    );
  }
}

// class SourceModel {
//   String? status;
//   List<Source>? sources;
//
//   SourceModel({this.status, this.sources});
//
//   SourceModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['sources'] != null) {
//       sources = <Source>[];
//       json['sources'].forEach((v) {
//         sources!.add(new Source.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.sources != null) {
//       data['sources'] = this.sources!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Source {
//   String? id;
//   String? name;
//   String? description;
//   String? url;
//   String? category;
//   String? language;
//   String? country;
//
//   Source(
//       {this.id,
//         this.name,
//         this.description,
//         this.url,
//         this.category,
//         this.language,
//         this.country});
//
//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     url = json['url'];
//     category = json['category'];
//     language = json['language'];
//     country = json['country'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['category'] = this.category;
//     data['language'] = this.language;
//     data['country'] = this.country;
//     return data;
//   }
// }
