class Stack<T> {
  List<T> stack = [];

  void push(T value) {
    stack.add(value);
  }

  T? pop() {
    if (stack.isEmpty) {
      return null;
    }
    return stack.removeLast();
  }

  T? peek() {
    if (stack.isEmpty) {
      return null;
    }
    return stack.last;
  }

  bool isEmpty() {
    return stack.isEmpty;
  }

  int size() {
    return stack.length;
  }

  void clear() {
    stack.clear();
  }
}
