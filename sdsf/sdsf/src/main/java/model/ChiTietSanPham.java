package model;

public class ChiTietSanPham {
private int idChiTietSanPham, MaSanPham, soLuong;
private String NgonNgu, NhaXuatBan;
private String daXoa;
public ChiTietSanPham(int idChiTietSanPham, int maSanPham, int soLuong, String NgonNgu, String NhaXuatBan,String daXoa) {
	super();
	this.idChiTietSanPham = idChiTietSanPham;
	MaSanPham = maSanPham;
	this.soLuong = soLuong;
	this.NgonNgu = NgonNgu;
	this.NhaXuatBan = NhaXuatBan;
	this.daXoa = daXoa;
}

public String getDaXoa() {
	return daXoa;
}

public void setDaXoa(String daXoa) {
	this.daXoa = daXoa;
}

public ChiTietSanPham() {
	super();
}
public int getIdChiTietSanPham() {
	return idChiTietSanPham;
}
public void setIdChiTietSanPham(int idChiTietSanPham) {
	this.idChiTietSanPham = idChiTietSanPham;
}
public int getMaSanPham() {
	return MaSanPham;
}
public void setMaSanPham(int maSanPham) {
	MaSanPham = maSanPham;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
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

}

