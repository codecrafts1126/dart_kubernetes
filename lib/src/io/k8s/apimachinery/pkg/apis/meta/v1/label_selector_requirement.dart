// ***************************************************************
// * Auto-generated. Please do not modify.                       *
// * Copyright (c) 2020-2023 Mahdi K. Fard.                      *
// ***************************************************************

part of io.k8s.apimachinery.pkg.apis.meta.v1;

/// A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
class LabelSelectorRequirement {
  /// Default constructor.
  const LabelSelectorRequirement({
    required this.key,
    required this.operator,
    this.values,
  });

  /// Creates a [LabelSelectorRequirement] from JSON data.
  factory LabelSelectorRequirement.fromJson(Map<String, dynamic> json) {
    final tempKeyJson = json['key'];
    final tempOperatorJson = json['operator'];
    final tempValuesJson = json['values'];

    final tempKey = tempKeyJson;
    final tempOperator = tempOperatorJson;
    final tempValues = tempValuesJson;

    return LabelSelectorRequirement(
      key: tempKey,
      operator: tempOperator,
      values: tempValues,
    );
  }

  /// key is the label key that the selector applies to.
  final String key;

  /// operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.
  final String operator;

  /// values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
  final List<String>? values;

  /// Converts a [LabelSelectorRequirement] instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    final tempKey = key;
    final tempOperator = operator;
    final tempValues = values;

    jsonData['key'] = tempKey;

    jsonData['operator'] = tempOperator;

    if (tempValues != null) {
      jsonData['values'] = tempValues;
    }

    return jsonData;
  }
}
