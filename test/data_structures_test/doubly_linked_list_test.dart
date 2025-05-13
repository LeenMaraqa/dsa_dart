import 'package:test/test.dart';
import '../../lib/data_structures/list/doubly_linked_list.dart';

void main() {
  group('DoublyLinkedList', () {
    late DoublyLinkedList<int> list;

    setUp(() {
      list = DoublyLinkedList<int>();
    });

    test('Insert and verify order', () {
      list.insertAtHead(2);
      list.insertAtHead(1);
      list.insertAtTail(3);
      expect(list.getAt(0), 1);
      expect(list.getAt(1), 2);
      expect(list.getAt(2), 3);
    });

    test('Insert at index', () {
      list.insertAtTail(1);
      list.insertAtTail(3);
      list.insertAt(1, 2);
      expect(list.getAt(0), 1);
      expect(list.getAt(1), 2);
      expect(list.getAt(2), 3);
    });

    test('Delete and verify contents', () {
      list.insertAtHead(1);
      list.insertAtHead(2);
      list.insertAtHead(3);
      final deleted = list.delete(2);
      expect(deleted, isTrue);
      expect(list.contains(2), isFalse);
      expect(list.length(), 2);
    });

    test('Length correctness', () {
      expect(list.length(), 0);
      list.insertAtTail(1);
      list.insertAtTail(2);
      expect(list.length(), 2);
    });

    test('Out of bounds getAt returns null', () {
      list.insertAtTail(1);
      expect(list.getAt(1), isNull);
    });

    test('Insert at invalid index throws error', () {
      expect(() => list.insertAt(5, 10), throwsRangeError);
    });

    test('Delete non existing element returns false', () {
      list.insertAtTail(1);
      expect(list.delete(99), isFalse);
    });
  });
}
