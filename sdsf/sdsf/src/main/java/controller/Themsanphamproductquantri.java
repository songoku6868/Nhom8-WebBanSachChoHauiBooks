package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import javax.imageio.ImageIO;

import Reponsitory.LaydulieuReponsitory;

@WebServlet("/Themsanphamproductquantri")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 100,       // 100MB
    maxRequestSize = 1024 * 1024 * 200,    // 200MB
    fileSizeThreshold = 1024 * 1024        // 1MB
)
public class Themsanphamproductquantri extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LaydulieuReponsitory lg = new LaydulieuReponsitory();

    public Themsanphamproductquantri() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tenSanPham = request.getParameter("addTensanpham");
        String idDanhMuc = request.getParameter("addDanhmucsanpham");
        String giaSP = request.getParameter("idGiasanpham");
        String moTa = request.getParameter("addMota");

        String imagePath = "";

        if (tenSanPham == null || tenSanPham.isEmpty() ||
            idDanhMuc == null || idDanhMuc.isEmpty() ||
            giaSP == null || giaSP.isEmpty() ||
            moTa == null || moTa.isEmpty()) {

            request.setAttribute("loi", "Không được để trống");
            request.getRequestDispatcher("productquantri.jsp").forward(request, response);
            return;
        }

        // Lấy ảnh từ form
        Part imagePart = request.getPart("image");

        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
            long fileSize = imagePart.getSize();

            if (fileSize > 1024 * 1024 * 100) {
                response.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE, "Ảnh quá lớn.");
                return;
            }

            // Lấy đường dẫn thật đến thư mục "images" trong webapp
            String realPath = getServletContext().getRealPath("/images");
            File uploadDir = new File(realPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            File outputFile;
            if (fileName.endsWith(".png")) {
                BufferedImage bufferedImage = ImageIO.read(imagePart.getInputStream());
                fileName = fileName.replace(".png", ".jpg");

                int newWidth = bufferedImage.getWidth() / 2;
                int newHeight = bufferedImage.getHeight() / 2;
                Image resizedImage = bufferedImage.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
                BufferedImage resizedBufferedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
                resizedBufferedImage.getGraphics().drawImage(resizedImage, 0, 0, null);

                outputFile = new File(uploadDir, fileName);
                ImageIO.write(resizedBufferedImage, "jpg", outputFile);
            } else {
                outputFile = new File(uploadDir, fileName);
                imagePart.write(outputFile.getAbsolutePath());
            }

            imagePath = "images/" + fileName;

            boolean ktra = lg.addSanPham(tenSanPham, Integer.parseInt(idDanhMuc), Float.parseFloat(giaSP), moTa, imagePath);

            if (ktra) {
                request.setAttribute("thongbao", "Thêm sản phẩm thành công!");
            } else {
                request.setAttribute("loi", "Thêm sản phẩm thất bại!");
            }
            request.getRequestDispatcher("productquantri.jsp").forward(request, response);
        } else {
            request.setAttribute("loi", "Chưa chọn ảnh.");
            request.getRequestDispatcher("productquantri.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
