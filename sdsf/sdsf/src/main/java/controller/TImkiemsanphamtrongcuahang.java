package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

@WebServlet("/TImkiemsanphamtrongcuahang")
public class TImkiemsanphamtrongcuahang extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String timKiem = request.getParameter("timKiem");
        List<SanPham> listSanPham = new ArrayList<>();
        
        // Chỉ tìm kiếm nếu có từ khóa
        if (timKiem != null && !timKiem.trim().isEmpty()) {
            listSanPham = lgn.TimKiemSanPham(timKiem.trim());
        }
        
        // Lấy danh sách danh mục (không bao gồm các danh mục đã xóa)
        List<DanhMuc> listDanhMuc = new ArrayList<>();
        List<DanhMuc> allDanhMuc = lg.Laythongtidanhmuc();
        
        for(DanhMuc danhMuc : allDanhMuc) {
            if(!"1".equals(danhMuc.getDaXoa())) {
                listDanhMuc.add(danhMuc);
            }
        }
        
        request.setAttribute("listDanhMuc", listDanhMuc);
        request.setAttribute("listHome", listSanPham);
        request.setAttribute("searchTerm", timKiem); // Giữ lại từ khóa tìm kiếm
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}