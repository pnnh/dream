
@JS()
library pillow_js; //Not avoid the library annotation

import 'package:js/js.dart';

import 'dart:js' as js;
import 'dart:js_util';

@JS('console.log') // annotates `log` function to call `console.log`
external void log(dynamic str);

@JS()
external sayHello();

@JS()
external String randomString(int length, bool hasNumber, bool hasLetter,
    bool hasUppercase, bool hasSymbol);