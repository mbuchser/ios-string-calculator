# ios-string-calculator
String calculator for IOS

String Calculator Kata (https://docs.codewars.com/concepts/kata/)

Create a simple String calculator with a method: int Add(string numbers)

- The numbers in the string are separated by a comma.
- Empty strings should return 0.
- The return type should be an integer.
- Example input: “1,2,3” - result: “6”.
- Write tests to prove your input validates.

- The Add method should handle new lines in the input format
  Example: “1\n,2,3” - Result: “6”  
  Example 2: “1,\n2,4” - Result: “7”
  
- Support a custom delimiter
  The beginning of your string will now contain a small control code that lets you set a custom delimiter.
  Format: “//[delimiter]\n[delimiter separated numbers]”
  Examples:
  “//;\n1;3;4” - Result: 8
  “//$\n1$2$3” - Result: 6
  “//@\n2@3@8” - Result: 13

- A negative number should throw an exception: “Negatives not allowed”. The exception should list the number(s) that caused the exception
