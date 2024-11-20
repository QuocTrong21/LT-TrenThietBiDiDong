class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai) {
    // Gọi các setter để thực hiện validation
    this.maDienThoai = _maDienThoai;
    this.tenDienThoai = _tenDienThoai;
    this.hangSanXuat = _hangSanXuat;
    this.giaNhap = _giaNhap;
    this.giaBan = _giaBan;
    this.soLuongTon = _soLuongTon;
  }

  // Getter và Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(value)) {
      throw ArgumentError("Mã điện thoại không hợp lệ (định dạng 'DT-XXX').");
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Tên điện thoại không được rỗng.");
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Hãng sản xuất không được rỗng.");
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw ArgumentError("Giá nhập phải lớn hơn 0.");
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= _giaNhap) {
      throw ArgumentError("Giá bán phải lớn hơn giá nhập.");
    }
    _giaBan = value;
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value < 0) {
      throw ArgumentError("Số lượng tồn phải >= 0.");
    }
    _soLuongTon = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() => (_giaBan - _giaNhap) * _soLuongTon;

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print(
        "Mã: $_maDienThoai | Tên: $_tenDienThoai | Hãng: $_hangSanXuat | Giá nhập: $_giaNhap | Giá bán: $_giaBan | Tồn kho: $_soLuongTon | Trạng thái: ${_trangThai ? 'Đang kinh doanh' : 'Ngừng kinh doanh'}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() => _trangThai && _soLuongTon > 0;
}
