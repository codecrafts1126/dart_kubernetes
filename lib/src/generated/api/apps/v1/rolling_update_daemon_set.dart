/// Spec to control the desired behavior of daemon set rolling update.
class RollingUpdateDaemonSet {
  /// The main constructor.
  const RollingUpdateDaemonSet({
    this.maxSurge,
    this.maxUnavailable,
  });

  /// Creates a RollingUpdateDaemonSet from JSON data.
  RollingUpdateDaemonSet.fromJson(Map<String, dynamic> json)
      : this(
          maxSurge: json['maxSurge'],
          maxUnavailable: json['maxUnavailable'],
        );

  /// Creates a list of RollingUpdateDaemonSet from JSON data.
  static List<RollingUpdateDaemonSet> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => RollingUpdateDaemonSet.fromJson(e)).toList();
  }

  /// Converts a RollingUpdateDaemonSet instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (maxSurge != null) {
      jsonData['maxSurge'] = maxSurge!;
    }
    if (maxUnavailable != null) {
      jsonData['maxUnavailable'] = maxUnavailable!;
    }

    return jsonData;
  }

  /// The maximum number of nodes with an existing available DaemonSet pod that can have an updated DaemonSet pod during during an update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up to a minimum of 1. Default value is 0. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their a new pod created before the old pod is marked as deleted. The update starts by launching new pods on 30% of nodes. Once an updated pod is available (Ready for at least minReadySeconds) the old DaemonSet pod on that node is marked deleted. If the old pod becomes unavailable for any reason (Ready transitions to false, is evicted, or is drained) an updated pod is immediatedly created on that node without considering surge limits. Allowing surge implies the possibility that the resources consumed by the daemonset on any given node can double if the readiness check fails, and so resource intensive daemonsets should take into account that they may cause evictions during disruption. This is beta field and enabled/disabled by DaemonSetUpdateSurge feature gate.
  final Object? maxSurge;

  /// The maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding down to a minimum of one. This cannot be 0 if MaxSurge is 0 Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.
  final Object? maxUnavailable;
}
