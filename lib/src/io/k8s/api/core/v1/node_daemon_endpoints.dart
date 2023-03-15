// ***************************************************************
// * Auto-generated. Please do not modify.                       *
// * Copyright (c) 2020-2023 Mahdi K. Fard.                      *
// ***************************************************************

part of io.k8s.api.core.v1;

/// NodeDaemonEndpoints lists ports opened by daemons running on the Node.
class NodeDaemonEndpoints {
  /// Default constructor.
  const NodeDaemonEndpoints({
    this.kubeletEndpoint,
  });

  /// Creates a [NodeDaemonEndpoints] from JSON data.
  factory NodeDaemonEndpoints.fromJson(Map<String, dynamic> json) {
    final tempKubeletEndpointJson = json['kubeletEndpoint'];

    final tempKubeletEndpoint = tempKubeletEndpointJson != null
        ? DaemonEndpoint.fromJson(tempKubeletEndpointJson)
        : null;

    return NodeDaemonEndpoints(
      kubeletEndpoint: tempKubeletEndpoint,
    );
  }

  /// Endpoint on which Kubelet is listening.
  final DaemonEndpoint? kubeletEndpoint;

  /// Converts a [NodeDaemonEndpoints] instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    final tempKubeletEndpoint = kubeletEndpoint;

    if (tempKubeletEndpoint != null) {
      jsonData['kubeletEndpoint'] = tempKubeletEndpoint.toJson();
    }

    return jsonData;
  }
}
