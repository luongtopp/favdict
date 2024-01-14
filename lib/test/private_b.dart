class ClassB {
  // ClassB();
  ClassB._(); // Constructor private
  String a = 'sdf';
  static final ClassB _instanceB = ClassB._(); // Instance của ClassB
  ClassB instanceB = _instanceB; // Instance của ClassB

  void printInstanceB() {}
}
