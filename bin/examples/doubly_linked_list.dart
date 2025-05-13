import '../../lib/data_structures/list/doubly_linked_list.dart';

void main() {
  final DoublyLinkedList<int> list = DoublyLinkedList<int>();
  print('Inserting at head:');
  list.insertAtHead(2);
  list.insertAtHead(1);
  list.printForward();

  print('Inserting at tail:');
  list.insertAtTail(3);
  list.insertAtTail(4);
  list.printForward();

  print('List backward:');
  list.printBackward();

  print('List forward:');
  list.printForward();

  print('Contains 1: ${list.contains(1)}'); 
  print('Contains 10: ${list.contains(10)}'); 

  print('Deleting 1');
  list.delete(1);
  list.printForward();

  print('Inserting at index 0:');
  list.insertAt(0, 1);
  list.printForward();

  print('Element at index 2: ${list.getAt(2)}'); 
  print('Length: ${list.length()}'); 
}
