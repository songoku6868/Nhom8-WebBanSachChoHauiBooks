package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ChiTietSanPham;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Themchitietsanpham
 */
@WebServlet("/Themchitietsanpham")
public class Themchitietsanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Themchitietsanpham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String NgonNgu = request.getParameter("color");
		String NhaXuatBan = request.getParameter("addNhaXuatBan");
		int soLuong = Integer.parseInt(request.getParameter("adSoluong"));
		
		
		System.out.println("ID: " + id);
		System.out.println("Màu sắc: " + NgonNgu);
		System.out.println("Kích cỡ: " + NhaXuatBan);
		System.out.println("Số lượng: " + soLuong);
		List<ChiTietSanPham> lt = lg.Laythongtinchitietsanpham();
		boolean ktratontai = false;
		int soLuongtontai = 0;
		for(ChiTietSanPham c : lt) {
			System.out.println("c "+c.getIdChiTietSanPham());
			if(c.getMaSanPham()==Integer.parseInt(id) && c.getNgonNgu().equalsIgnoreCase(NgonNgu) && c.getNhaXuatBan().equalsIgnoreCase(NhaXuatBan)) {
				ktratontai = true;
				soLuongtontai = c.getSoLuong();
				System.out.println("đã vào đay ");
			}
		}
		if(!ktratontai) {
			boolean ktra = lg.addChiTietSP(Integer.parseInt(id), NgonNgu, NhaXuatBan, soLuong);
			if(ktra) {
				  response.sendRedirect("Chitietproductquantri.jsp");
			}else {
				request.setAttribute("loi", "Sản phẩm đã tồn tại");

			}
			
		}else {
			request.setAttribute("loi", "loi tont tai");
			request.getRequestDispatcher("Chitietproductquantri.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
