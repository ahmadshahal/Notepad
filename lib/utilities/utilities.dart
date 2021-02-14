class Utility {
  static final List monthsList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static final List colors = [
    "0xFFFF8A80",
    "0xFFC8E6C9",
    "0xFFB3E5FC",
  ];

  // * Returns True if the String's first letter is an arabic charachter.
  static bool isArabic(String str) {
    if (str == null) return false;
    if (str[0].codeUnits[0] <= 1610 && str[0].codeUnits[0] >= 1571) return true;
    return false;
  }

  // * If the String is long, cut a part of it and exchange it with "..".
  static String modifyStringLength(String str) {
    if (str != null && str.length >= 76) {
      int i;
      for (i = 76; i > 0; i--) {
        if (str[i] == ' ') break;
      }
      String altString = str.substring(0, i);
      altString += '..';
      return altString;
    }
    return str;
  }

  // * Parses the DateTime to a String Date format "Month / DD / YYYY".
  static String dateTransformer(DateTime date) {
    return "${monthsList[date.month - 1]} ${date.day}, ${date.year}";
  }
}
