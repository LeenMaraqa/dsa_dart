import '../../lib/data_structures/list/stack.dart';

void main() {
  final Stack<String> stack = Stack<String>();
  stack.push('a');
  stack.push('b');
  stack.push('c');
  print('top: ${stack.peek()}');
  print('size: ${stack.size()}');
  print('pop: ${stack.pop()}');
  print('new Top: ${stack.peek()}');
  stack.clear();
  print('After clearing, is the stack empty? ${stack.isEmpty()}');
}
