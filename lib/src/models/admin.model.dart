import 'dart:convert';

List<Admin> adminModelFromJson(String str) =>
    List<Admin>.from(json.decode(str).map((x) => Admin.fromJson(x)));

String adminModelToJson(List<Admin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admin {
  int id;
  String name;
  String username;
  // String title;
  // String category;
  // int answeredCount;
  // String completionEstimatedTime;
  // String addedAt;

  Admin({
    required this.id,
    required this.name,
    required this.username,
    // required this.title,
    // required this.category,
    // required this.answeredCount,
    // required this.completionEstimatedTime,
    // required this.addedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        // title: json["title"],
        // category: json["category"],
        // answeredCount: json["answered_count"],
        // completionEstimatedTime: json["completion_estimated_time"],
        // addedAt: json["added_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        // "title": title,
        // "category": category,
        // "answeredCount": answeredCount,
        // "completionEstimatedTime": completionEstimatedTime,
        // "addedAt": addedAt,
      };
}

// class Admin {
//   List<Items>? items;
//   Meta? meta;
//   Links? links;
//
//   Admin({this.items, this.meta, this.links});
//
//   Admin.fromJson(Map<String, dynamic> json) {
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(Items.fromJson(v));
//       });
//     }
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//     links = json['links'] != null ? Links.fromJson(json['links']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (items != null) {
//       data['items'] = items!.map((v) => v.toJson()).toList();
//     }
//     if (meta != null) {
//       data['meta'] = meta!.toJson();
//     }
//     if (links != null) {
//       data['links'] = links!.toJson();
//     }
//     return data;
//   }
// }
//
// class Items {
//   int? id;
//   String? title;
//   String? category;
//   int? answeredCount;
//   String? completionEstimatedTime;
//   String? addedAt;
//
//   Items({
//     this.id,
//     this.title,
//     this.category,
//     this.answeredCount,
//     this.completionEstimatedTime,
//     this.addedAt,
//   });
//
//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     category = json['category'];
//     answeredCount = json['answered_count'];
//     completionEstimatedTime = json['completion_estimated_time'];
//     addedAt = json['added_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['category'] = category;
//     data['answered_count'] = answeredCount;
//     data['completion_estimated_time'] = completionEstimatedTime;
//     data['added_at'] = addedAt;
//     return data;
//   }
// }
//
// class Meta {
//   int? totalItems;
//   int? itemCount;
//   int? itemsPerPage;
//   int? totalPages;
//   int? currentPage;
//
//   Meta(
//       {this.totalItems,
//       this.itemCount,
//       this.itemsPerPage,
//       this.totalPages,
//       this.currentPage});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     totalItems = json['totalItems'];
//     itemCount = json['itemCount'];
//     itemsPerPage = json['itemsPerPage'];
//     totalPages = json['totalPages'];
//     currentPage = json['currentPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['totalItems'] = totalItems;
//     data['itemCount'] = itemCount;
//     data['itemsPerPage'] = itemsPerPage;
//     data['totalPages'] = totalPages;
//     data['currentPage'] = currentPage;
//     return data;
//   }
// }
//
// class Links {
//   String? first;
//   String? previous;
//   String? next;
//   String? last;
//
//   Links({this.first, this.previous, this.next, this.last});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     first = json['first'];
//     previous = json['previous'];
//     next = json['next'];
//     last = json['last'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first'] = first;
//     data['previous'] = previous;
//     data['next'] = next;
//     data['last'] = last;
//     return data;
//   }
// }
