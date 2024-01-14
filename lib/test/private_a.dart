import 'package:favdict/test/private_b.dart';

class ClassA {
  ClassA();
  ClassA._(); // Constructor private

  // static final ClassA _instanceA = ClassA._(); // Instance của ClassA

  void printInstanceA() {
    print('=========');
    // instanceB.print(ClassB().a);
    // print(
    //     _instanceA); // Có thể truy cập _instanceA từ ClassB trong cùng một tệp
  }
}

void main() {
  ClassA().printInstanceA(); // In ra _instanceA
  // ClassB.printInstanceB(); // In ra _instanceB
}
