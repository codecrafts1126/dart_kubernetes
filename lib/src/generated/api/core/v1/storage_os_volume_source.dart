import 'package:kubernetes/src/generated/api/core/v1/local_object_reference.dart';

/// Represents a StorageOS persistent volume resource.
class StorageOSVolumeSource {
  /// The main constructor.
  const StorageOSVolumeSource({
    this.fsType,
    this.readOnly,
    this.secretRef,
    this.volumeName,
    this.volumeNamespace,
  });

  /// Creates a StorageOSVolumeSource from JSON data.
  StorageOSVolumeSource.fromJson(Map<String, dynamic> json)
      : this(
          fsType: json['fsType'],
          readOnly: json['readOnly'],
          secretRef: json['secretRef'] != null
              ? LocalObjectReference.fromJson(json['secretRef'])
              : null,
          volumeName: json['volumeName'],
          volumeNamespace: json['volumeNamespace'],
        );

  /// Creates a list of StorageOSVolumeSource from JSON data.
  static List<StorageOSVolumeSource> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => StorageOSVolumeSource.fromJson(e)).toList();
  }

  /// Converts a StorageOSVolumeSource instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (fsType != null) {
      jsonData['fsType'] = fsType!;
    }
    if (readOnly != null) {
      jsonData['readOnly'] = readOnly!;
    }
    if (secretRef != null) {
      jsonData['secretRef'] = secretRef!.toJson();
    }
    if (volumeName != null) {
      jsonData['volumeName'] = volumeName!;
    }
    if (volumeNamespace != null) {
      jsonData['volumeNamespace'] = volumeNamespace!;
    }

    return jsonData;
  }

  /// Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
  final String? fsType;

  /// Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  final bool? readOnly;

  /// SecretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
  final LocalObjectReference? secretRef;

  /// VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
  final String? volumeName;

  /// VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
  final String? volumeNamespace;
}
