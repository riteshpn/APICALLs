// import 'package:flutter/material.dart';

// class TextStyles {
//   static const TextStyle titleStyle = TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 18,
//     color: Colors.white,
//   );

//   static const TextStyle subtitleStyle = TextStyle(
//     fontWeight: FontWeight.w600,
//     fontSize: 16,
//     color: Colors.white,
//   );

//   static const TextStyle descriptionStyle = TextStyle(
//     fontSize: 14,
//     color: Colors.white,
//   );
// }

import 'package:flutter/material.dart';

enum TextStyleType {
  titleStyle,
  subtitleStyle,
  descriptionStyle,
  postTitleStyle,
  postdescriptionStyle
}

extension TextStyleTypeExtension on TextStyleType {
  FontWeight get getFontWeight {
    switch (this) {
      case TextStyleType.titleStyle:
        return FontWeight.bold;
      case TextStyleType.subtitleStyle:
        return FontWeight.w600;
      case TextStyleType.descriptionStyle:
        return FontWeight.normal;
      case TextStyleType.postTitleStyle:
        return FontWeight.bold;
      case TextStyleType.postdescriptionStyle:
        return FontWeight.normal;

      default:
        return FontWeight.bold;
    }
  }

  double get getFontsize {
    switch (this) {
      case TextStyleType.titleStyle:
        return 13.0;
      case TextStyleType.subtitleStyle:
        return 14.0;
      case TextStyleType.postTitleStyle:
        return 14.0;
      case TextStyleType.postdescriptionStyle:
        return 12.0;
      default:
        return 10.0;
    }
  }

  Color get getFontcolor {
    switch (this) {
      case TextStyleType.titleStyle || TextStyleType.subtitleStyle:
        return Colors.blue;
      case TextStyleType.descriptionStyle:
        return Colors.red;
      case TextStyleType.postTitleStyle:
        return Colors.white;
      case TextStyleType.postdescriptionStyle:
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
