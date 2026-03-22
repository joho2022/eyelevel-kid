class VersionComparer {
  static int compare(String a, String b) {
    final aParts = a.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final bParts = b.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    final maxLength = aParts.length > bParts.length
        ? aParts.length
        : bParts.length;

    while (aParts.length < maxLength) {
      aParts.add(0);
    }

    while (bParts.length < maxLength) {
      bParts.add(0);
    }

    for (int index = 0; index < maxLength; index++) {
      if (aParts[index] > bParts[index]) return 1;
      if (aParts[index] < bParts[index]) return -1;
    }

    return 0;
  }

  static bool isLowerThan(String currentVersion, String targetVersion) {
    return compare(currentVersion, targetVersion) < 0;
  }
}