import 'dart:math';

final lorem = LoremIpsumGenerator();

class LoremIpsumGenerator {
  static const List<String> _words = [
    'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing', 'elit', 'sed', 'do', 'eiusmod', 'tempor',
    'incididunt', 'ut', 'labore', 'et', 'dolore', 'magna', 'aliqua', 'ut', 'enim', 'ad', 'minim', 'veniam', 'quis', 'nostrud',
    'exercitation', 'ullamco', 'laboris', 'nisi', 'ut', 'aliquip', 'ex', 'ea', 'commodo', 'consequat', 'duis', 'aute',
    'irure', 'dolor', 'in', 'reprehenderit', 'in', 'voluptate', 'velit', 'esse', 'cillum', 'dolore', 'eu', 'fugiat', 'nulla',
    'pariatur', 'excepteur', 'sint', 'occaecat', 'cupidatat', 'non', 'proident', 'sunt', 'in', 'culpa', 'qui', 'officia',
    'deserunt', 'mollit', 'anim', 'id', 'est', 'laborum'
  ];

  final Random _random = Random();

  // Generate random word
  String _randomWord() {
    return _words[_random.nextInt(_words.length)];
  }

  // Generate a single sentence with a specified number of words
  String sentence(int wordCount) {
    List<String> sentence = [];
    for (int i = 0; i < wordCount; i++) {
      sentence.add(_randomWord());
    }
    String result = sentence.join(' ');
    return '${result[0].toUpperCase()}${result.substring(1)}.';
  }

  // Generate multiple sentences, each with a random number of words between minWords and maxWords
  String paragraph(int sentenceCount, {int minWords = 5, int maxWords = 15}) {
    List<String> paragraph = [];
    for (int i = 0; i < sentenceCount; i++) {
      int wordCount = minWords + _random.nextInt(maxWords - minWords + 1);
      paragraph.add(sentence(wordCount));
    }
    return paragraph.join(' ');
  }

  // Generate random words
  String words(int wordCount) {
    List<String> words = [];
    for (int i = 0; i < wordCount; i++) {
      words.add(_randomWord());
    }
    return words.join(' ');
  }
}