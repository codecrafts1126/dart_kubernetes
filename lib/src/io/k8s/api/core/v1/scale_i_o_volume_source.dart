// ***************************************************************
// * Auto-generated. Please do not modify.                       *
// * Copyright (c) 2020-2023 Mahdi K. Fard.                      *
// ***************************************************************

part of io.k8s.api.core.v1;

/// ScaleIOVolumeSource represents a persistent ScaleIO volume.
class ScaleIOVolumeSource {
  /// Default constructor.
  const ScaleIOVolumeSource({
    this.fsType,
    required this.gateway,
    this.protectionDomain,
    this.readOnly,
    required this.secretRef,
    this.sslEnabled,
    this.storageMode,
    this.storagePool,
    required this.system,
    this.volumeName,
  });

  /// Creates a [ScaleIOVolumeSource] from JSON data.
  factory ScaleIOVolumeSource.fromJson(Map<String, dynamic> json) {
    final tempFsTypeJson = json['fsType'];
    final tempGatewayJson = json['gateway'];
    final tempProtectionDomainJson = json['protectionDomain'];
    final tempReadOnlyJson = json['readOnly'];
    final tempSecretRefJson = json['secretRef'];
    final tempSslEnabledJson = json['sslEnabled'];
    final tempStorageModeJson = json['storageMode'];
    final tempStoragePoolJson = json['storagePool'];
    final tempSystemJson = json['system'];
    final tempVolumeNameJson = json['volumeName'];

    final tempFsType = tempFsTypeJson;
    final tempGateway = tempGatewayJson;
    final tempProtectionDomain = tempProtectionDomainJson;
    final tempReadOnly = tempReadOnlyJson;
    final tempSecretRef = LocalObjectReference.fromJson(tempSecretRefJson);
    final tempSslEnabled = tempSslEnabledJson;
    final tempStorageMode = tempStorageModeJson;
    final tempStoragePool = tempStoragePoolJson;
    final tempSystem = tempSystemJson;
    final tempVolumeName = tempVolumeNameJson;

    return ScaleIOVolumeSource(
      fsType: tempFsType,
      gateway: tempGateway,
      protectionDomain: tempProtectionDomain,
      readOnly: tempReadOnly,
      secretRef: tempSecretRef,
      sslEnabled: tempSslEnabled,
      storageMode: tempStorageMode,
      storagePool: tempStoragePool,
      system: tempSystem,
      volumeName: tempVolumeName,
    );
  }

  /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs".
  final String? fsType;

  /// gateway is the host address of the ScaleIO API Gateway.
  final String gateway;

  /// protectionDomain is the name of the ScaleIO Protection Domain for the configured storage.
  final String? protectionDomain;

  /// readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  final bool? readOnly;

  /// secretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
  final LocalObjectReference secretRef;

  /// sslEnabled Flag enable/disable SSL communication with Gateway, default false.
  final bool? sslEnabled;

  /// storageMode indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
  final String? storageMode;

  /// storagePool is the ScaleIO Storage Pool associated with the protection domain.
  final String? storagePool;

  /// system is the name of the storage system as configured in ScaleIO.
  final String system;

  /// volumeName is the name of a volume already created in the ScaleIO system that is associated with this volume source.
  final String? volumeName;

  /// Converts a [ScaleIOVolumeSource] instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    final tempFsType = fsType;
    final tempGateway = gateway;
    final tempProtectionDomain = protectionDomain;
    final tempReadOnly = readOnly;
    final tempSecretRef = secretRef;
    final tempSslEnabled = sslEnabled;
    final tempStorageMode = storageMode;
    final tempStoragePool = storagePool;
    final tempSystem = system;
    final tempVolumeName = volumeName;

    if (tempFsType != null) {
      jsonData['fsType'] = tempFsType;
    }

    jsonData['gateway'] = tempGateway;

    if (tempProtectionDomain != null) {
      jsonData['protectionDomain'] = tempProtectionDomain;
    }

    if (tempReadOnly != null) {
      jsonData['readOnly'] = tempReadOnly;
    }

    jsonData['secretRef'] = tempSecretRef.toJson();

    if (tempSslEnabled != null) {
      jsonData['sslEnabled'] = tempSslEnabled;
    }

    if (tempStorageMode != null) {
      jsonData['storageMode'] = tempStorageMode;
    }

    if (tempStoragePool != null) {
      jsonData['storagePool'] = tempStoragePool;
    }

    jsonData['system'] = tempSystem;

    if (tempVolumeName != null) {
      jsonData['volumeName'] = tempVolumeName;
    }

    return jsonData;
  }
}
