import 'package:dsa_dart/data_structures/list/linked_list.dart';

void main() {
  final LinkedList<int> numbers = LinkedList<int>();
  numbers.add(1);
  numbers.add(3);
  numbers.add(4);
  print('After adding: $numbers');
  numbers.insert(1, 2);
  print('After inserting 2 at index 1: $numbers');
  numbers.removeAt(3);
  print('After removal: $numbers');
  print('Contains 1? ${numbers.contains(1)}');
  print('Contains 0? ${numbers.contains(0)}');
}