class CircularNode<T> {
  T data;
  CircularNode<T>? next;
  CircularNode(this.data);
}

class CircularLinkedList<T> {
  CircularNode<T>? head;
  CircularNode<T>? tail;
  int _length = 0;

  void insert(T data) {
    final CircularNode<T> newNode = CircularNode<T>(data);
    if (head == null) {
      head = tail = newNode;
      newNode.next = head;
    } else {
      tail!.next = newNode;
      tail = newNode;
      tail!.next = head;
    }
    _length++;
  }

  bool delete(T data) {
    if (head == null) {
      return false;
    }

    CircularNode<T>? current = head;
    CircularNode<T>? previous;

    for (int i = 0; i < _length; i++) {
      if (current!.data == data) {
        if (previous == null) {
          if (_length == 1) {
            head = tail = null;
          } else {
            head = head!.next;
            tail!.next = head;
          }
        } else {
          previous.next = current.next;
          if (current == tail) {
            tail = previous;
          }
        }
        _length--;
        return true;
      }
      previous = current;
      current = current.next;
    }
    return false;
  }

  bool contains(T data) {
    if (head == null) {
      return false;
    }

    CircularNode<T>? current = head;
    for (int i = 0; i < _length; i++) {
      if (current!.data == data) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  T? getAt(int index) {
    if (index < 0 || index >= _length) {
      return null;
    }

    CircularNode<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }
    return current?.data;
  }

  void printList() {
    if (head == null) {
      return;
    }

    CircularNode<T>? current = head;
    for (int i = 0; i < _length; i++) {
      print(current!.data);
      current = current.next;
    }
  }

  int length() => _length;
}
