class Queue<T> {
  List<T> queue = [];

  void enqueue(T item) {
    queue.add(item);
  }

  T? dequeue() {
    if (queue.isEmpty) {
      return null;
    }
    return queue.removeAt(0);
  }

  T? front() {
    if (queue.isEmpty) {
      return null;
    }
    return queue[0];
  }

  bool isEmpty() {
    return queue.isEmpty;
  }

  int size() {
    return queue.length;
  }

  void clear() {
    queue.clear();
  }
}
