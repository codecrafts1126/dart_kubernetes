// ***************************************************************
// * Auto-generated. Please do not modify.                       *
// * Copyright (c) 2020-2023 Mahdi K. Fard.                      *
// ***************************************************************

part of io.k8s.api.apps.v1;

/// StatefulSetCondition describes the state of a statefulset at a certain point.
class StatefulSetCondition {
  /// Default constructor.
  const StatefulSetCondition({
    this.lastTransitionTime,
    this.message,
    this.reason,
    required this.status,
    required this.type,
  });

  /// Creates a [StatefulSetCondition] from JSON data.
  factory StatefulSetCondition.fromJson(Map<String, dynamic> json) {
    final tempLastTransitionTimeJson = json['lastTransitionTime'];
    final tempMessageJson = json['message'];
    final tempReasonJson = json['reason'];
    final tempStatusJson = json['status'];
    final tempTypeJson = json['type'];

    final DateTime? tempLastTransitionTime = tempLastTransitionTimeJson != null
        ? DateTime.tryParse(tempLastTransitionTimeJson)
        : null;
    final String? tempMessage = tempMessageJson;
    final String? tempReason = tempReasonJson;
    final String tempStatus = tempStatusJson;
    final String tempType = tempTypeJson;

    return StatefulSetCondition(
      lastTransitionTime: tempLastTransitionTime,
      message: tempMessage,
      reason: tempReason,
      status: tempStatus,
      type: tempType,
    );
  }

  /// Last time the condition transitioned from one status to another.
  final DateTime? lastTransitionTime;

  /// A human readable message indicating details about the transition.
  final String? message;

  /// The reason for the condition's last transition.
  final String? reason;

  /// Status of the condition, one of True, False, Unknown.
  final String status;

  /// Type of statefulset condition.
  final String type;

  /// Converts a [StatefulSetCondition] instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    final tempLastTransitionTime = lastTransitionTime;
    final tempMessage = message;
    final tempReason = reason;
    final tempStatus = status;
    final tempType = type;

    if (tempLastTransitionTime != null) {
      jsonData['lastTransitionTime'] = tempLastTransitionTime;
    }

    if (tempMessage != null) {
      jsonData['message'] = tempMessage;
    }

    if (tempReason != null) {
      jsonData['reason'] = tempReason;
    }

    jsonData['status'] = tempStatus;

    jsonData['type'] = tempType;

    return jsonData;
  }
}