import 'package:kubernetes/src/generated/kubernetes/api/core/v1/weighted_pod_affinity_term.dart';
import 'package:kubernetes/src/generated/kubernetes/api/core/v1/pod_affinity_term.dart';

/// Pod anti affinity is a group of inter pod anti affinity scheduling rules.
class PodAntiAffinity {
  /// The main constructor.
  const PodAntiAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  /// Creates a PodAntiAffinity from JSON data.
  PodAntiAffinity.fromJson(Map<String, dynamic> json)
      : this(
          preferredDuringSchedulingIgnoredDuringExecution:
              json['preferredDuringSchedulingIgnoredDuringExecution'] != null
                  ? WeightedPodAffinityTerm.listFromJson(
                      (json['preferredDuringSchedulingIgnoredDuringExecution']
                              as Iterable)
                          .cast<Map<String, dynamic>>())
                  : null,
          requiredDuringSchedulingIgnoredDuringExecution:
              json['requiredDuringSchedulingIgnoredDuringExecution'] != null
                  ? PodAffinityTerm.listFromJson(
                      (json['requiredDuringSchedulingIgnoredDuringExecution']
                              as Iterable)
                          .cast<Map<String, dynamic>>())
                  : null,
        );

  /// Creates a list of PodAntiAffinity from JSON data.
  static List<PodAntiAffinity> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => PodAntiAffinity.fromJson(e)).toList();
  }

  /// Converts a PodAntiAffinity instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (preferredDuringSchedulingIgnoredDuringExecution != null) {
      jsonData['preferredDuringSchedulingIgnoredDuringExecution'] =
          preferredDuringSchedulingIgnoredDuringExecution!
              .map((item) => item.toJson())
              .toList();
    }
    if (requiredDuringSchedulingIgnoredDuringExecution != null) {
      jsonData['requiredDuringSchedulingIgnoredDuringExecution'] =
          requiredDuringSchedulingIgnoredDuringExecution!
              .map((item) => item.toJson())
              .toList();
    }

    return jsonData;
  }

  /// The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
  final List<WeightedPodAffinityTerm>?
      preferredDuringSchedulingIgnoredDuringExecution;

  /// If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
  final List<PodAffinityTerm>? requiredDuringSchedulingIgnoredDuringExecution;
}
