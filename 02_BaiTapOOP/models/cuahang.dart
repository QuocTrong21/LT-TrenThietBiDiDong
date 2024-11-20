import 'dart:core';
import '../models/dienthoai.dart';
import '../models/hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Phương thức thêm điện thoại mới
  void themDienThoai(DienThoai dt) {
    _danhSachDienThoai.add(dt);
    print("Đã thêm điện thoại: ${dt.tenDienThoai}");
  }

  // Phương thức cập nhật thông tin điện thoại
  void capNhatDienThoai(String ma, DienThoai dtMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == ma) {
        int index = _danhSachDienThoai.indexOf(dt);
        _danhSachDienThoai[index] = dtMoi;
        print("Cập nhật thành công cho mã điện thoại: $ma");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $ma");
  }

  // Phương thức ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String ma) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == ma) {
        dt.trangThai = false;
        print("Điện thoại với mã $ma đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $ma");
  }

  // Phương thức tìm kiếm điện thoại
  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhSachDienThoai.where((dt) {
      bool match = true;
      if (ma != null) match = match && dt.maDienThoai.contains(ma);
      if (ten != null) match = match && dt.tenDienThoai.contains(ten);
      if (hang != null) match = match && dt.hangSanXuat.contains(hang);
      return match;
    }).toList();
  }

  // Phương thức hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Phương thức tạo hóa đơn mới
  void taoHoaDon(HoaDon hoaDon) {
    DienThoai? dienThoai = _danhSachDienThoai
        .firstWhere((dt) => dt.maDienThoai == hoaDon.dienThoai.maDienThoai);

    if (dienThoai.coTheBan()) {
      if (dienThoai.soLuongTon >= hoaDon.soLuongMua) {
        dienThoai.soLuongTon -= hoaDon.soLuongMua;
        _danhSachHoaDon.add(hoaDon);
        print("Hóa đơn đã được tạo thành công.");
      } else {
        print("Số lượng tồn không đủ để tạo hóa đơn.");
      }
    } else {
      print("Điện thoại không khả dụng để bán.");
    }
  }

  // Phương thức hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTin();
    }
  }

  // Phương thức tính tổng doanh thu theo khoảng thời gian
  double tinhDoanhThu(DateTime fromDate, DateTime toDate) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.isAfter(fromDate) && hd.ngayBan.isBefore(toDate);
    }).fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  // Phương thức tính tổng lợi nhuận theo khoảng thời gian
  double tinhLoiNhuan(DateTime fromDate, DateTime toDate) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.isAfter(fromDate) && hd.ngayBan.isBefore(toDate);
    }).fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  // Phương thức thống kê tồn kho
  void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dt in _danhSachDienThoai) {
      print(
          "Mã: ${dt.maDienThoai} | Tên: ${dt.tenDienThoai} | Tồn kho: ${dt.soLuongTon}");
    }
  }
}
