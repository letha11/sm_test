import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_test/helper/palindrome_check.dart';

void main() {
  test('isPalindrome', () {
    expect(palindromeCheck('kasur rusak'), true);
    expect(palindromeCheck('step on no pets'), true);
    expect(palindromeCheck('put it up'), true);
    expect(palindromeCheck('suitmedia'), false);
  });
}
