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

  static bool isArabic(String str) {
    if (str == null) return false;
    for (int i = 0; i < str.length; i++) {
      if (str[i].codeUnits[0] <= 1610 && str[i].codeUnits[0] >= 1571)
        return true;
    }
    return false;
  }

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

  static String dateTransformer(DateTime date) {
    DateTime dateParse = DateTime.parse(date.toString());
    return "${monthsList[dateParse.month - 1]} ${dateParse.day}, ${dateParse.year}";
  }
}
