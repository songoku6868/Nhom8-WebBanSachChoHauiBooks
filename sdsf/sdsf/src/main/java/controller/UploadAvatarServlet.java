package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import Reponsitory.LaydulieuReponsitory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/UploadAvatarServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class UploadAvatarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images"; // thư mục lưu ảnh trong webapp

    public UploadAvatarServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Có thể redirect hoặc báo lỗi không hỗ trợ GET
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for uploading avatar.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Ghinhotaikhoan") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy user đã đăng nhập
        List<User> users = (List<User>) session.getAttribute("Ghinhotaikhoan");
        User user = users.get(0);

        // Lấy file upload
        Part filePart = request.getPart("avatar");
        if (filePart == null || filePart.getSubmittedFileName() == null || filePart.getSubmittedFileName().isEmpty()) {
            response.sendRedirect("Thongtincanhan.jsp?error=NoFile");
            return;
        }

        // Tên file gốc
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Lấy phần mở rộng file
        String fileExtension = "";
        int i = fileName.lastIndexOf(".");
        if (i >= 0) {
            fileExtension = fileName.substring(i);
        }

        // Đặt tên file mới dựa trên ID user để tránh trùng
        String newFileName = "avatar_user_" + user.getMaTaiKhoan() + fileExtension;

        // Đường dẫn lưu file lên server
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Ghi file ra server
        filePart.write(uploadPath + File.separator + newFileName);

        // Cập nhật đường dẫn avatar trong đối tượng user và database
        String avatarPath = UPLOAD_DIR + "/" + newFileName;
        user.setAvatar(avatarPath);

        LaydulieuReponsitory repo = new LaydulieuReponsitory();
        repo.updateAvatar(user.getMaTaiKhoan(), avatarPath);

        // Cập nhật session
        users.set(0, user);
        session.setAttribute("Ghinhotaikhoan", users);

        // Chuyển hướng về trang thông tin cá nhân
        response.sendRedirect("Thongtincanhan.jsp");
    }
}
