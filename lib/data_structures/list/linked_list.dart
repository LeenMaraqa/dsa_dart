/// Node class representing an element in the linked list.
class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);
}

/// A generic singly linked list class.
class LinkedList<T> {
  Node<T>? head;
  int _length = 0;

  /// Returns the number of elements in the list.
  int get length => _length;

  /// Adds [value] to the end of the list.
  void add(T value) {
  Node<T> newNode = Node(value);
  if (head == null) {
    head = newNode;
  } else {
    Node<T>? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = newNode;
  }
  _length++; 
  }

  /// Inserts [value] at the given [index].
  void insert(int index, T value) {
    if (index < 0 || index > _length) {
        throw RangeError('Index $index is out of bounds');
    } else {
      Node<T>? current = head;
      int i = 0;
      while (i < index - 1 && current != null) {
        current = current.next;
        i++;
      }
      if (current != null) {
        current.next = Node(value, current.next);
        _length++;
      }
    }
  }

  /// Removes and returns the element at [index].

  T removeAt(int index) {
    if (index < 0 || index >= _length) {
       throw RangeError('Index $index is out of bounds');
    }
    Node<T>? current = head;
    if (index == 0) {
      head = current?.next;
    } else {
      Node<T>? previous;
      for (int i = 0; i < index; i++) {
        previous = current;
        current = current?.next;
      }
      if (previous != null && current != null) {
        previous.next = current.next;
      }
    }
    
    _length--;
    return current?.data as T;
  }

  /// Returns `true` if [value] is found in the list.
  bool contains(T value) {
    Node<T>? current = head;
    while (current != null){
      if (current.data == value) {
        return true;        
      } else {
        current = current.next;
      }
    }
    return false;
  }

  /// Returns the index of the first occurrence of [value],
  /// or -1 if not found.
  int indexOf(T value) {
    Node<T>? current = head;
    int index = 0;
    while (current != null) {
      if (current.data == value){
        return index;
      } else {
        current = current.next;
        index++;
      }
    }
    return -1;
  }

  /// Clears the entire list.
  void clear() {
    head = null;
    _length = 0;
  }

  /// Provides read access to the element at [index].
  T operator [](int index) {
  if (index < 0 || index >= _length) {
    throw RangeError('Index $index is out of bounds');
  }

  Node<T>? current = head;
  for (int i = 0; i < index; i++) {
    current = current?.next;
  }
  return current!.data;
}

  /// Provides write access to element at [index].
  void operator []=(int index, T value) {
  if (index < 0 || index >= _length) {
    throw RangeError('Index $index is out of bounds');
  }
  Node<T>? current = head;
  for (int i = 0; i < index; i++) {
    current = current?.next;
  }
  current!.data = value;
}
  /// Concatenates this list with [other] and returns a new list.  
  LinkedList<T> operator +(LinkedList<T> other) {
  LinkedList<T> newList = LinkedList<T>();
  Node<T>? current = head;
  while (current != null) {
    newList.add(current.data);
    current = current.next;
  }
  current = other.head;
  while (current != null) {
    newList.add(current.data);
    current = current.next;
  }
  return newList;
}
  /// Returns a new list with the first occurrence of [value] removed.
  LinkedList<T> operator -(T value) {
  LinkedList<T> newList = LinkedList<T>();
  Node<T>? current = head;
    
  bool found = false;
  while (current != null) {
    if (current.data == value && !found) {
      found = true;
    } else {
      newList.add(current.data);
    }
    current = current.next;
  }
    
  if (!found) {
    print('Value $value not found in the list');
  }

  return newList;
}

  /// Applies the given [action] to each element in the list.
  void forEach(void Function(T) action) {
  Node<T>? current = head;
  while (current != null) {
    action(current.data); 
    current = current.next;
  }
}

  /// Returns a new [LinkedList] containing the results of applying [transform] to each element.
  LinkedList<S> map<S>(S Function(T) transform) {
  LinkedList<S> newList = LinkedList<S>(); 
  Node<T>? current = head;
  while (current != null) {
    newList.add(transform(current.data)); 
    current = current.next; 
  }
  return newList; 
}

  /// Returns a new [LinkedList] containing only the elements that satisfy [test].
  LinkedList<T> where(bool Function(T) test) {
  LinkedList<T> newList = LinkedList<T>(); 
  Node<T>? current = head;
  while (current != null) {
    if (test(current.data)) {
      newList.add(current.data); 
    }
    current = current.next;
  }
  return newList; 
}

  @override
  String toString() {
    // TODO: Implement a string representation of the list.
    return 'LinkedList: []';
  }
}



