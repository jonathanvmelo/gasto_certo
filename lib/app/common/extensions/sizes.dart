import 'package:flutter/material.dart';

class Sizes {
  Sizes._();
  double _width = 0;
  double _height = 0;

// Valor inicial baseado no prototipo do Figma
  static const Size _designSize = Size(414.0, 896.0);

  static final Sizes _instance = Sizes._();

  factory Sizes() => _instance;

  double get height => _height;
  double get width => _width;

  static void init(
    BuildContext context, {
    Size designSize = _designSize,
  }) {
    final deviceData = MediaQuery.maybeOf(context);
    // ignore: unused_local_variable
    final deviceSize = deviceData?.size ?? _designSize;

    _instance._height = designSize.height;
    _instance._width = designSize.width;
  }
}

extension SizesExt on num {
  //Calcula o valor proporcional baseado na largura do dispositivo em relação ao protótipo
  double get w {
    return (this * Sizes._instance.width) / Sizes._designSize.width;
  }

  //Calcula o valor proporcional baseado na altura do dispositivo em relação ao protótipo
  double get h {
    return (this * Sizes._instance.height) / Sizes._designSize.height;
  }
}
