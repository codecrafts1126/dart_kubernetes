import 'package:kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1.dart';

import 'request_authentication.dart';

/// Represents a list of [RequestAuthentication].
class RequestAuthenticationList {
  /// The main constructor.
  const RequestAuthenticationList({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  /// Creates a RequestAuthenticationList from JSON data.
  RequestAuthenticationList.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          items: json['items'] != null
              ? RequestAuthentication.listFromJson(
                  (json['items'] as Iterable).cast<Map<String, dynamic>>())
              : [],
          kind: json['kind'],
          metadata: json['metadata'] != null
              ? ListMeta.fromJson(json['metadata'])
              : null,
        );

  /// Creates a list of RequestAuthenticationList from JSON data.
  static List<RequestAuthenticationList> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => RequestAuthenticationList.fromJson(e)).toList();
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  final String? apiVersion;

  /// A list of RequestAuthentication.
  final List<RequestAuthentication> items;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  final String? kind;

  /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
  final ListMeta? metadata;
}
