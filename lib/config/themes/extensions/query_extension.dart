import 'package:flutter/cupertino.dart';

extension QueryExtension on BuildContext {
  double get queryWidth {
    return MediaQuery.of(this).size.width;
  }

  double get queryHeight {
    return MediaQuery.of(this).size.height;
  }
}
