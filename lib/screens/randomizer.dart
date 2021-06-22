import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'package:random_words/random_words.dart';

main() {
  generateWordPairs().take(10).forEach(print);
  generateAdjective().take(10).forEach(print);
  generateNoun().take(10).forEach(print);

  print(randomBetween(10, 20)); // some integer between 10 and 20
  print(randomNumeric(4)); // sequence of 4 random numbers i.e. 3259
  print(randomString(10)); // random sequence of 10 characters i.e. e~f93(4l-
  print(randomAlpha(5)); // random sequence of 5 alpha characters i.e. aRztC
  print(randomAlphaNumeric(
      10)); // random sequence of 10 alpha numeric i.e. aRztC1y32B

}

class _Provider with AbstractRandomProvider {
  _Provider();
  double nextDouble() => 0.5;
}
