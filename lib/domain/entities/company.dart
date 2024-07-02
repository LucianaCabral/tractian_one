class Company {
  final String id;
  final String name;
  final String? parentId;

  Company(this.parentId, {required this.id, required this.name});
}