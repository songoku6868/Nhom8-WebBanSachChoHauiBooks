package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.LoginService;

import java.io.IOException;

/**
 * Servlet implementation class Xoasanphamproductquantri
 */
@WebServlet("/Xoasanphamproductqt")
public class Xoasanphamproductquantri extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginService lg = new LoginService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("id trong phần xóa sản phẩm là: " + id);
            
            // Thử xóa chi tiết sản phẩm trước
            boolean ktrachitietsanpham = lg.Xoachitietsanpham(id);
            System.out.println("Kết quả xóa chi tiết sản phẩm: " + ktrachitietsanpham);
            
            // Sau đó xóa sản phẩm chính
            boolean ktraSanPham = lg.Xoasanpham(id);
            System.out.println("Kết quả xóa sản phẩm: " + ktraSanPham);
            
            if(ktraSanPham) {
                // Chuyển hướng về trang quản trị nếu thành công
                response.sendRedirect("productquantri.jsp");
            } else {
                // Thông báo lỗi nếu không thành công
                request.setAttribute("error", "Xóa sản phẩm không thành công");
                request.getRequestDispatcher("productquantri.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("productquantri.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}