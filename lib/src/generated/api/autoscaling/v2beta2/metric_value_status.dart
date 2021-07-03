import 'package:kubernetes/src/generated/apimachinery/pkg/api/resource/quantity.dart';

/// MetricValueStatus holds the current value for a metric
class MetricValueStatus {
  /// The main constructor.
  const MetricValueStatus({
    this.averageUtilization,
    this.averageValue,
    this.value,
  });

  /// Creates a MetricValueStatus from JSON data.
  MetricValueStatus.fromJson(Map<String, dynamic> json)
      : this(
          averageUtilization: json['averageUtilization'],
          averageValue: json['averageValue'] != null
              ? Quantity.fromJson(json['averageValue'])
              : null,
          value:
              json['value'] != null ? Quantity.fromJson(json['value']) : null,
        );

  /// Creates a list of MetricValueStatus from JSON data.
  static List<MetricValueStatus> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => MetricValueStatus.fromJson(e)).toList();
  }

  /// currentAverageUtilization is the current value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.
  final int? averageUtilization;

  /// averageValue is the current value of the average of the metric across all relevant pods (as a quantity)
  final Quantity? averageValue;

  /// value is the current value of the metric (as a quantity).
  final Quantity? value;
}