class CompanyModel {
  final String id;
  final String name;
  final String? parentId;

  CompanyModel({required this.id, required this.name, this.parentId});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        id: json['id'], name: json['name'], parentId: json['parentId']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'parentId': parentId};
  }
}
