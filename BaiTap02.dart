// BaiTap02.dart;
// Giai phuong trinh bac hai: ax^2+bx+c=0;
import 'dart:io';
import 'dart:math';

void main() {
  // Hàm nhập số từ người dùng và kiểm tra số không
  double inputNonZeroNumber(String message) {
    while (true) {
      stdout.write(message); // Hiển thị thông báo
      String? input = stdin.readLineSync(); // Đọc dữ liệu từ bàn phím
      if (input != null) {
        double? number = double.tryParse(input); // Chuyển đổi sang số
        if (number != null && number != 0) {
          return number; // Trả về nếu hợp lệ
        }
      }
      print("Giá trị không hợp lệ. Vui lòng nhập một số khác 0.");
    }
  }

  // Nhập các hệ số từ người dùng, đảm bảo không có giá trị bằng 0
  double a = inputNonZeroNumber("Nhập hệ số a (khác 0): ");
  double b = inputNonZeroNumber("Nhập hệ số b (khác 0): ");
  double c = inputNonZeroNumber("Nhập hệ số c (khác 0): ");

  // Giải phương trình
  if (a == 0) {
    if (b != 0) {
      double x = -c / b;
      print("Phương trình có một nghiệm: x = $x");
    } else {
      print(c == 0 ? "Phương trình vô số nghiệm." : "Phương trình vô nghiệm.");
    }
  } else {
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      print("Phương trình vô nghiệm (không có nghiệm thực).");
    } else if (delta == 0) {
      double x = -b / (2 * a);
      print("Phương trình có nghiệm kép: x = $x");
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print("Phương trình có hai nghiệm phân biệt:");
      print("x1 = $x1");
      print("x2 = $x2");
    }
  }
}
