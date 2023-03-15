// ***************************************************************
// * Auto-generated. Please do not modify.                       *
// * Copyright (c) 2020-2023 Mahdi K. Fard.                      *
// ***************************************************************

part of io.k8s.api.core.v1;

/// LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.
class LocalObjectReference {
  /// Default constructor.
  const LocalObjectReference({
    this.name,
  });

  /// Creates a [LocalObjectReference] from JSON data.
  factory LocalObjectReference.fromJson(Map<String, dynamic> json) {
    final tempNameJson = json['name'];

    final tempName = tempNameJson;

    return LocalObjectReference(
      name: tempName,
    );
  }

  /// Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names.
  final String? name;

  /// Converts a [LocalObjectReference] instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    final tempName = name;

    if (tempName != null) {
      jsonData['name'] = tempName;
    }

    return jsonData;
  }
}
