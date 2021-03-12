import 'package:webfeed/domain/media/category.dart';
import 'package:webfeed/domain/media/content.dart';
import 'package:webfeed/domain/media/credit.dart';
import 'package:webfeed/domain/media/rating.dart';
import 'package:webfeed/util/xml.dart';
import 'package:xml/xml.dart';

class Group {
  final List<Content>? contents;
  final List<Credit>? credits;
  final Category? category;
  final Rating? rating;

  Group({
    this.contents,
    this.credits,
    this.category,
    this.rating,
  });

  static parse(XmlElement? element) {
    if (element == null) return null;
    return Group(
      contents: element.findElements('media:content').map((e) {
        return Content.parse(e);
      }).toList(),
      credits: element.findElements('media:credit').map((e) {
        return Credit.parse(e);
      }).toList(),
      category: Category.parse(
        findFirstElement(element, 'media:category'),
      ),
      rating: Rating.parse(
        findFirstElement(element, 'media:rating'),
      ),
    );
  }
}
