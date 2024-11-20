import 'dart:core';
import '../models/dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(this._maHoaDon, this._ngayBan, this.dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    // Gọi các setter để thực hiện validation
    this.maHoaDon = _maHoaDon;
    this.ngayBan = _ngayBan;
    this.soLuongMua = _soLuongMua;
    this.giaBanThucTe = _giaBanThucTe;
    this.tenKhachHang = _tenKhachHang;
    this.soDienThoaiKhach = _soDienThoaiKhach;
  }

  // Getter và Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw ArgumentError("Mã hóa đơn không hợp lệ (định dạng 'HD-XXX').");
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError("Ngày bán không được sau ngày hiện tại.");
    }
    _ngayBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > dienThoai.soLuongTon) {
      throw ArgumentError("Số lượng mua không hợp lệ.");
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError("Giá bán thực tế phải lớn hơn 0.");
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Tên khách hàng không được rỗng.");
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      throw ArgumentError("Số điện thoại không hợp lệ.");
    }
    _soDienThoaiKhach = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() => _giaBanThucTe * _soLuongMua;

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() =>
      (_giaBanThucTe - dienThoai.giaNhap) * _soLuongMua;

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print(
        "Hóa đơn: $_maHoaDon | Ngày: $_ngayBan | Khách: $_tenKhachHang | SĐT: $_soDienThoaiKhach | Điện thoại: ${dienThoai.tenDienThoai} | Số lượng: $_soLuongMua | Tổng tiền: ${tinhTongTien()} | Lợi nhuận: ${tinhLoiNhuanThucTe()}");
  }
}
