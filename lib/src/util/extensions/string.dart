import 'dart:convert';

extension StringFormattingExtension on String {
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
}

extension JWTParser on String {
  Map<String, dynamic>? get parseJWT {
    try {
      final String normalizedSource = base64Url.normalize(split('.')[1]);
      return jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));
    } catch (e) {
      return null;
    }
  }
}
