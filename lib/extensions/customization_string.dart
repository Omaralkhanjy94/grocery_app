extension StringCustomization on String {
  ///Create new line if a string length exceeds [maxLength]
  String addNewLine({int maxLength = 15}) {
    if (length <= maxLength) return this;
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(this[i]);
      if ((i + 1) % maxLength == 0 && i != length - 1) {
        buffer.write('\n');
      }
      if (length - i <= maxLength) {
        buffer.write(substring(i + 1));
        break;
      }
    }
    return buffer.toString();
  }
}
