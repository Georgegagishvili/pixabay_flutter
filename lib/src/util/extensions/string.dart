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

extension LoremExtension on String {
  String get loremIpsum => 'orem Ipsum is simply dummy text of the'
      ' printing and typesetting industry. Lorem '
      "Ipsum has been the industry's standard dummy"
      ' text ever since the 1500s, when an unknown printer '
      'took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic '
      'typesetting, remaining essentially unchanged.'
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
      ' and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
}
