class MoreApp {
  const MoreApp({
    required this.icon,
    required this.name,
    required this.packageName,
    required this.banner,
    required this.description,
  });

  final String icon;
  final String name;
  final String packageName;
  final String banner;
  final String description;

  factory MoreApp.fromJson(Map<String, dynamic> json) => MoreApp(
        icon: json['icon'] as String? ?? '',
        name: json['name'] as String? ?? '',
        packageName: json['packageName'] as String? ?? '',
        banner: json['banner'] as String? ?? '',
        description: json['description'] as String? ?? '',
      );
}
