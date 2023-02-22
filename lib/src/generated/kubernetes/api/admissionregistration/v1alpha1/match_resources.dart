import 'package:kubernetes/src/generated/kubernetes/api/admissionregistration/v1alpha1/named_rule_with_operations.dart';
import 'package:kubernetes/src/generated/kubernetes/apimachinery/pkg/apis/meta/v1/label_selector.dart';

/// MatchResources decides whether to run the admission control policy on an object based on whether it meets the match criteria. The exclude rules take precedence over include rules (if a resource matches both, it is excluded).
class MatchResources {
  /// The main constructor.
  const MatchResources({
    this.excludeResourceRules,
    this.matchPolicy,
    this.namespaceSelector,
    this.objectSelector,
    this.resourceRules,
  });

  /// Creates a MatchResources from JSON data.
  MatchResources.fromJson(Map<String, dynamic> json)
      : this(
          excludeResourceRules: json['excludeResourceRules'] != null
              ? NamedRuleWithOperations.listFromJson(
                  (json['excludeResourceRules'] as Iterable)
                      .cast<Map<String, dynamic>>())
              : null,
          matchPolicy: json['matchPolicy'],
          namespaceSelector: json['namespaceSelector'] != null
              ? LabelSelector.fromJson(json['namespaceSelector'])
              : null,
          objectSelector: json['objectSelector'] != null
              ? LabelSelector.fromJson(json['objectSelector'])
              : null,
          resourceRules: json['resourceRules'] != null
              ? NamedRuleWithOperations.listFromJson(
                  (json['resourceRules'] as Iterable)
                      .cast<Map<String, dynamic>>())
              : null,
        );

  /// Creates a list of MatchResources from JSON data.
  static List<MatchResources> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => MatchResources.fromJson(e)).toList();
  }

  /// Converts a MatchResources instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (excludeResourceRules != null) {
      jsonData['excludeResourceRules'] =
          excludeResourceRules!.map((item) => item.toJson()).toList();
    }
    if (matchPolicy != null) {
      jsonData['matchPolicy'] = matchPolicy!;
    }
    if (namespaceSelector != null) {
      jsonData['namespaceSelector'] = namespaceSelector!.toJson();
    }
    if (objectSelector != null) {
      jsonData['objectSelector'] = objectSelector!.toJson();
    }
    if (resourceRules != null) {
      jsonData['resourceRules'] =
          resourceRules!.map((item) => item.toJson()).toList();
    }

    return jsonData;
  }

  /// ExcludeResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy should not care about. The exclude rules take precedence over include rules (if a resource matches both, it is excluded).
  final List<NamedRuleWithOperations>? excludeResourceRules;

  /// MatchPolicy defines how the "MatchResources" list is used to match incoming requests. Allowed values are "Exact" or "Equivalent".
  ///
  /// - Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the ValidatingAdmissionPolicy.
  ///
  /// - Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the ValidatingAdmissionPolicy.
  ///
  /// Defaults to "Equivalent".
  final String? matchPolicy;

  /// NamespaceSelector decides whether to run the admission control policy on an object based on whether the namespace for that object matches the selector. If the object itself is a namespace, the matching is performed on object.metadata.labels. If the object is another cluster scoped resource, it never skips the policy.
  ///
  /// For example, to run the webhook on any objects whose namespace is not associated with "runlevel" of "0" or "1";  you will set the selector as follows: "namespaceSelector": {
  ///   "matchExpressions": [
  ///     {
  ///       "key": "runlevel",
  ///       "operator": "NotIn",
  ///       "values": [
  ///         "0",
  ///         "1"
  ///       ]
  ///     }
  ///   ]
  /// }
  ///
  /// If instead you want to only run the policy on any objects whose namespace is associated with the "environment" of "prod" or "staging"; you will set the selector as follows: "namespaceSelector": {
  ///   "matchExpressions": [
  ///     {
  ///       "key": "environment",
  ///       "operator": "In",
  ///       "values": [
  ///         "prod",
  ///         "staging"
  ///       ]
  ///     }
  ///   ]
  /// }
  ///
  /// See https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ for more examples of label selectors.
  ///
  /// Default to the empty LabelSelector, which matches everything.
  final LabelSelector? namespaceSelector;

  /// ObjectSelector decides whether to run the validation based on if the object has matching labels. objectSelector is evaluated against both the oldObject and newObject that would be sent to the cel validation, and is considered to match if either object matches the selector. A null object (oldObject in the case of create, or newObject in the case of delete) or an object that cannot have labels (like a DeploymentRollback or a PodProxyOptions object) is not considered to match. Use the object selector only if the webhook is opt-in, because end users may skip the admission webhook by setting the labels. Default to the empty LabelSelector, which matches everything.
  final LabelSelector? objectSelector;

  /// ResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy matches. The policy cares about an operation if it matches _any_ Rule.
  final List<NamedRuleWithOperations>? resourceRules;
}
