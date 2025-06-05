package model;

public class GioHang {
private int maGioHang, maNguoiDung, maChiTietSanPham;
private String NgonNgu, NhaXuatBan, trangThai;
private float gia;
private int soLuong;
private String duongDan, tenSanPham;
public GioHang() {
	super();
}
public GioHang(int maGioHang, int maNguoiDung, int maChiTietSanPham, String NgonNgu, String NhaXuatBan, String trangThai,
		float gia, int soLuong, String duongDan, String tenSanPham) {
	super();
	this.maGioHang = maGioHang;
	this.maNguoiDung = maNguoiDung;
	this.maChiTietSanPham = maChiTietSanPham;
	this.NgonNgu = NgonNgu;
	this.NhaXuatBan = NhaXuatBan;
	this.trangThai = trangThai;
	this.gia = gia;
	this.soLuong = soLuong;
	this.duongDan = duongDan;
	this.tenSanPham = tenSanPham;
}
public int getMaGioHang() {
	return maGioHang;
}
public void setMaGioHang(int maGioHang) {
	this.maGioHang = maGioHang;
}
public int getMaNguoiDung() {
	return maNguoiDung;
}
public void setMaNguoiDung(int maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
}
public int getMaChiTietSanPham() {
	return maChiTietSanPham;
}
public void setMaChiTietSanPham(int maChiTietSanPham) {
	this.maChiTietSanPham = maChiTietSanPham;
}
public String getNgonNgu() {
	return NgonNgu;
}
public void setNgonNgu(String NgonNgu) {
	this.NgonNgu = NgonNgu;
}
public String getNhaXuatBan() {
	return NhaXuatBan;
}
public void setNhaXuatBan(String NhaXuatBan) {
	this.NhaXuatBan = NhaXuatBan;
}
public String getTrangThai() {
	return trangThai;
}
public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
}
public float getGia() {
	return gia;
}
public void setGia(float gia) {
	this.gia = gia;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public String getDuongDan() {
	return duongDan;
}
public void setDuongDan(String duongDan) {
	this.duongDan = duongDan;
}
public String getTenSanPham() {
	return tenSanPham;
}
public void setTenSanPham(String tenSanPham) {
	this.tenSanPham = tenSanPham;
}


}

