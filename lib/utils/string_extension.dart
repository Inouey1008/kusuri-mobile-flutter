extension StringExtension on String {
  String katakanaToHiragana() {
    final hiragana = runes.map((int charCode) {
      if (0x30A1 <= charCode && charCode <= 0x30F6) {
        return String.fromCharCode(charCode - 0x60);
      } else {
        return String.fromCharCode(charCode);
      }
    }).join('');

    return hiragana;
  }

  String hankakuToZenkaku() {
    return split('').map((char) {
      int code = char.codeUnitAt(0);
      if (code >= 33 && code <= 126) {
        return String.fromCharCode(code + 0xFEE0);
      } else if (code == 32) {
        return '\u3000';
      } else {
        return char;
      }
    }).join('');
  }
}
