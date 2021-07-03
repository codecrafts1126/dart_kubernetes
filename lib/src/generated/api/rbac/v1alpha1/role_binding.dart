import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/object_meta.dart';
import 'package:kubernetes/src/generated/api/rbac/v1alpha1/role_ref.dart';
import 'package:kubernetes/src/generated/api/rbac/v1alpha1/subject.dart';

/// RoleBinding references a role, but does not contain it.  It can reference a Role in the same namespace or a ClusterRole in the global namespace. It adds who information via Subjects and namespace information by which namespace it exists in.  RoleBindings in a given namespace only have effect in that namespace. Deprecated in v1.17 in favor of rbac.authorization.k8s.io/v1 RoleBinding, and will no longer be served in v1.22.
class RoleBinding {
  /// The main constructor.
  const RoleBinding({
    this.apiVersion,
    this.kind,
    this.metadata,
    required this.roleRef,
    this.subjects,
  });

  /// Creates a RoleBinding from JSON data.
  RoleBinding.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          kind: json['kind'],
          metadata: json['metadata'] != null
              ? ObjectMeta.fromJson(json['metadata'])
              : null,
          roleRef: RoleRef.fromJson(json['roleRef']),
          subjects: json['subjects'] != null
              ? Subject.listFromJson(
                  (json['subjects'] as Iterable).cast<Map<String, dynamic>>())
              : null,
        );

  /// Creates a list of RoleBinding from JSON data.
  static List<RoleBinding> listFromJson(Iterable<Map<String, dynamic>> list) {
    return list.map((e) => RoleBinding.fromJson(e)).toList();
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  final String? apiVersion;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  final String? kind;

  /// Standard object's metadata.
  final ObjectMeta? metadata;

  /// RoleRef can reference a Role in the current namespace or a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
  final RoleRef roleRef;

  /// Subjects holds references to the objects the role applies to.
  final List<Subject>? subjects;
}
