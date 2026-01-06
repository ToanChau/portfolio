class VersionInfo {
  static String? version;
  static String? source;
  static String? environment;

  VersionInfo._();

  static String versionInfoString() {
    return '$version-$source-$environment';
  }

  static String dotnetEnvName() {
    switch (environment) {
      case 'dev':
        return 'Developer';
      case 'sandbox':
        return 'Sandbox';
      case 'prod':
        return 'Production';
      default:
        return 'Production';
    }
  }

  static bool showDebug() {
    return false;
    return environment == 'dev';
  }
}