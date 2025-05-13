import '../../lib/data_structures/list/queue.dart';

void main() {
  final Queue<String> queue = Queue<String>();
  queue.enqueue('a');
  queue.enqueue('b');
  queue.enqueue('c');
  print('front: ${queue.front()}');
  print('size: ${queue.size()}');
  print('dequeue: ${queue.dequeue()}');
  print('new Front: ${queue.front()}');
  queue.clear();
  print('After clearing, is the queue empty? ${queue.isEmpty()}');
}
