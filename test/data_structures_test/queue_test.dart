import 'package:test/test.dart';
import '../../lib/data_structures/list/queue.dart';

void main() {
  group('Queue Basic Operations', () {
    late Queue<int> queue;

    setUp(() {
      queue = Queue<int>();
    });

//Enqueue/dequeue order

    test('enqueue should add elements to the end of queue', () {
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.front(), equals(1));
    });

    test('dequeue should remove the first element', () {
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      expect(queue.dequeue(), equals(1));
      expect(queue.size(), equals(2));
    });

//Edge cases like dequeue on empty

    test('dequeue on empty queue should return null', () {
      expect(queue.dequeue(), isNull);
    });

//Front access without removal

    test('front should return the first element without removing it', () {
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.front(), equals(1));
      expect(queue.size(), equals(2));
    });

//Edge cases like front on empty

    test('front on empty queue should return null', () {
      expect(queue.front(), isNull);
    });

//Size tracking and clear verification

    test('clear should remove all elements', () {
      queue.enqueue(1);
      queue.enqueue(2);
      queue.clear();
      expect(queue.size(), equals(0));
    });
  });
}
