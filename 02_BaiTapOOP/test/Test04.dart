import '../models/dienthoai.dart';
import '../models/hoadon.dart';
import '../models/cuahang.dart';

void main() {
  // Tạo đối tượng CuaHang
  var cuaHang =
      CuaHang("Cửa hàng Điện thoại ABC", "123 Đường Chính, Thành phố");

  // Thêm điện thoại
  var dt1 = DienThoai("DT-001", "iPhone 14", "Apple", 20000, 25000, 10, true);
  var dt2 =
      DienThoai("DT-002", "Galaxy S23", "Samsung", 18000, 23000, 15, true);
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Hiển thị danh sách điện thoại
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  var hoaDon = HoaDon(
      "HD-001", DateTime.now(), dt1, 2, 25000, "Nguyen Van A", "0123456789");
  cuaHang.taoHoaDon(hoaDon);

  // Hiển thị danh sách hóa đơn
  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê doanh thu và lợi nhuận
  print(
      "Doanh thu: ${cuaHang.tinhDoanhThu(DateTime(2023, 1, 1), DateTime.now())}");
  print(
      "Lợi nhuận: ${cuaHang.tinhLoiNhuan(DateTime(2023, 1, 1), DateTime.now())}");

  // Thống kê tồn kho
  cuaHang.thongKeTonKho();
}
