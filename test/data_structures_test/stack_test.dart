import 'package:test/test.dart';
import '../../lib/data_structures/list/stack.dart';

void main() {
  group('Stack Basic Operations', () {
    late Stack<int> stack;

    setUp(() {
      stack = Stack<int>();
    });

//Push/pop order
//Empty check before and after operations

    test('push should add elements to the top of stack', () {
      stack.push(1);
      stack.push(2);
      expect(stack.size(), equals(2));
      expect(stack.peek(), equals(2));
      expect(stack.isEmpty(), isFalse);
    });

    test('pop should remove the top of stack and return it', () {
      stack.push(1);
      stack.push(2);
      final removed = stack.pop();
      expect(removed, equals(2));
      expect(stack.size(), equals(1));
    });

//Boundary behavior (e.g., pop from empty)
    test('pop from empty stack should return null', () {
      expect(stack.pop(), isNull);
    });

//Peek correctness
    test('peek should return the top of stack', () {
      stack.push(5);
      expect(stack.peek(), equals(5));
    });

    test('peek from empty stack should return null', () {
      expect(stack.peek(), isNull);
    });

//Clear resets the stack
//Empty check before and after operations
    test('clear should empty the stack', () {
      stack.push(1);
      stack.push(2);
      stack.clear();
      expect(stack.size(), equals(0));
      expect(stack.isEmpty(), isTrue);
    });
  });
}
