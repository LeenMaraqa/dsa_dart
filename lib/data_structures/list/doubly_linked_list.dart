class Node<T> {
  T data;
  Node<T>? next;
  Node<T>? prev;
  Node(this.data);
}

class DoublyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int _length = 0;

  void insertAtHead(T data) {
    final Node<T> newNode = Node<T>(data);
    if (head == null) {
      head = tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    _length++;
  }

  void insertAtTail(T data) {
    final newNode = Node<T>(data);
    if (tail == null) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    _length++;
  }

  void insertAt(int index, T data) {
    if (index < 0 || index > _length) {
      throw RangeError('Index out of bounds');
    }
    if (index == 0) {
      insertAtHead(data);
      return;
    }
    if (index == _length) {
      insertAtTail(data);
      return;
    }

    final newNode = Node<T>(data);
    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    newNode.prev = current!.prev;
    newNode.next = current;
    current.prev!.next = newNode;
    current.prev = newNode;

    _length++;
  }

  bool delete(T data) {
    Node<T>? current = head;

    while (current != null) {
      if (current.data == data) {
        if (current.prev != null) {
          current.prev!.next = current.next;
        } else {
          head = current.next;
        }

        if (current.next != null) {
          current.next!.prev = current.prev;
        } else {
          tail = current.prev;
        }

        _length--;
        return true;
      }
      current = current.next;
    }
    return false;
  }

  T? getAt(int index) {
    if (index < 0 || index >= _length) return null;

    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    return current?.data;
  }

  bool contains(T data) {
    Node<T>? current = head;
    while (current != null) {
      if (current.data == data) return true;
      current = current.next;
    }
    return false;
  }

  void printForward() {
    Node<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void printBackward() {
    Node<T>? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  int length() => _length;
}
