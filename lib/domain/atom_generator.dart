import 'package:xml/xml.dart';

class AtomGenerator {
  final String? uri;
  final String? version;
  final String? value;

  AtomGenerator(this.uri, this.version, this.value);

  static parse(XmlElement? element) {
    if (element == null) return null;
    var uri = element.getAttribute('uri');
    var version = element.getAttribute('version');
    var value = element.text;
    return AtomGenerator(uri, version, value);
  }
}
