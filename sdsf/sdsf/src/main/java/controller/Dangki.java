package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Mahoa;
import service.LoginService;

import java.io.IOException;

import org.apache.coyote.Request;

import Reponsitory.DangKiReponsitory;
import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Dangki
 */
@WebServlet("/dang-ki")
public class Dangki extends HttpServlet {
	private static final long serialVersionUID = 1L;
private LoginService lg = new LoginService();
private LaydulieuReponsitory dk = new LaydulieuReponsitory();
private Mahoa mh = new Mahoa();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dangki() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String tenTaiKhoan = request.getParameter("tenDangKi").trim();
	    String email = request.getParameter("emailDangKi").trim();
	    String matKhau1 = request.getParameter("passDangKi").trim();
	    String matKhau2 = request.getParameter("passDangKi2").trim();
	    String hoTen = request.getParameter("hoTen").trim();
	    String soDienThoai = request.getParameter("soDienThoai").trim();
	    String diaChi = request.getParameter("diaChi").trim();
	    
	    String mahoa = mh.hashPassword(matKhau1);
	    
	    // Kiểm tra tài khoản đã tồn tại
	    boolean kiemTra = lg.LoginSoSanh(tenTaiKhoan, mahoa);
	    if (kiemTra) {
	        request.setAttribute("error", "Tài khoản đã tồn tại");
	        request.getRequestDispatcher("/register.jsp").forward(request, response);
	    } else {
	        boolean Dangki = dk.Dangki(tenTaiKhoan, mahoa, email, hoTen, soDienThoai, diaChi);
	        if (Dangki) {
	            // Thêm thông báo thành công vào session
	            request.getSession().setAttribute("registerSuccess", "Đăng ký thành công! Vui lòng đăng nhập.");
	            response.sendRedirect(request.getContextPath() + "/login.jsp");
	        } else {
	            request.setAttribute("error", "Có lỗi xảy ra khi đăng ký. Vui lòng thử lại.");
	            request.getRequestDispatcher("/register.jsp").forward(request, response);
	        }
	    }
	}

}
