bool palindromeCheck(String text) {
  bool isPalindrome = true;
  text = text.toLowerCase().replaceAll(' ', '');
  for (var i = 0; i < (text.length / 2).round(); i++) {
    if (text[i] != text[text.length - i - 1]) {
      isPalindrome = false;
      break;
    }
  }

  return isPalindrome;
}
