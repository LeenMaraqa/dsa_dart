import '../../lib/data_structures/list/circular_linked_list.dart';

void main() {
  final CircularLinkedList<int> list = CircularLinkedList<int>();
  print('Inserting:');
  list.insert(1);
  list.insert(2);
  list.insert(3);
  list.printList();

  print('Contains 1: ${list.contains(1)}');
  print('Contains 4: ${list.contains(4)}');

  print('Delete 2');
  list.delete(2);
  list.printList();

  print('Deleting non-existent element 10');
  list.delete(10);
  list.printList();

  print('Inserting more:');
  list.insert(4);
  list.insert(5);
  list.printList();

  print('Element at index 0: ${list.getAt(0)}');
  print('Element at index 2: ${list.getAt(2)}');
  print('Element at invalid index 10: ${list.getAt(10)}');

  print('Length: ${list.length()}');
}
