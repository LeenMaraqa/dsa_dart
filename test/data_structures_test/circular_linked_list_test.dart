import 'package:test/test.dart';
import '../../lib/data_structures/list/circular_linked_list.dart';

void main() {
  group('CircularLinkedList Core Behavior', () {
    late CircularLinkedList<int> list;

    setUp(() {
      list = CircularLinkedList<int>();
    });

    test('should insert and verify cycle', () {
      list.insert(10);
      list.insert(20);
      list.insert(30);

      expect(list.head != null, isTrue);
      expect(list.tail != null, isTrue);
      expect(list.tail!.next, equals(list.head)); 
    });

    test('should delete and ensure circular integrity', () {
      list.insert(1);
      list.insert(2);
      list.insert(3);
      list.delete(2);

      expect(list.contains(2), isFalse);
      expect(list.tail!.next, equals(list.head)); 
    });

    test('traversal should stop correctly after one loop', () {
      list.insert(1);
      list.insert(2);
      list.insert(3);

      final values = <int>[];
      var current = list.head;
      if (current != null) {
        do {
          values.add(current!.data);
          current = current.next;
        } while (current != list.head);
      }

      expect(values, equals([1, 2, 3]));
    });

    test('length, contains, and getAt correctness', () {
      list.insert(5);
      list.insert(10);
      list.insert(15);

      expect(list.length(), equals(3));
      expect(list.contains(10), isTrue);
      expect(list.getAt(0), equals(5));
      expect(list.getAt(1), equals(10));
      expect(list.getAt(2), equals(15));
      expect(list.getAt(5), isNull); 
    });

    group('Edge Cases', () {
      test('empty list behavior', () {
        expect(list.length(), equals(0));
        expect(list.contains(1), isFalse);
        expect(list.getAt(0), isNull);
        expect(list.delete(1), isFalse);
        expect(list.head, isNull);
      });

      test('one-node list delete', () {
        list.insert(99);
        expect(list.length(), equals(1));
        expect(list.head, equals(list.tail));
        expect(list.tail!.next, equals(list.head));

        final deleted = list.delete(99);
        expect(deleted, isTrue);
        expect(list.length(), equals(0));
        expect(list.head, isNull);
        expect(list.tail, isNull);
      });

      test('delete all elements one by one', () {
        list.insert(1);
        list.insert(2);
        list.insert(3);
        list.delete(1);
        list.delete(2);
        list.delete(3);

        expect(list.length(), equals(0));
        expect(list.head, isNull);
        expect(list.tail, isNull);
      });
    });
  });
}
