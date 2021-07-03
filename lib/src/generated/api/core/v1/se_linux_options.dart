/// SELinuxOptions are the labels to be applied to the container
class SELinuxOptions {
  /// The main constructor.
  const SELinuxOptions({
    this.level,
    this.role,
    this.type,
    this.user,
  });

  /// Creates a SELinuxOptions from JSON data.
  SELinuxOptions.fromJson(Map<String, dynamic> json)
      : this(
          level: json['level'],
          role: json['role'],
          type: json['type'],
          user: json['user'],
        );

  /// Creates a list of SELinuxOptions from JSON data.
  static List<SELinuxOptions> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => SELinuxOptions.fromJson(e)).toList();
  }

  /// Level is SELinux level label that applies to the container.
  final String? level;

  /// Role is a SELinux role label that applies to the container.
  final String? role;

  /// Type is a SELinux type label that applies to the container.
  final String? type;

  /// User is a SELinux user label that applies to the container.
  final String? user;
}
