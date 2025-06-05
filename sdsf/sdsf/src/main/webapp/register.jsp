<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="cssdangnhap/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" />
    <style>
        .error-message {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
        .success-message {
            color: green;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Form without bootstrap -->
    <div class="auth-wrapper">
        <div class="auth-container">
            <div class="auth-action-left">
                <div class="auth-form-outer">
                    <h2 class="auth-form-title">
                        Tạo tài khoản
                    </h2>
                    <%-- Hiển thị thông báo lỗi --%>
                    <% if(request.getAttribute("error") != null) { %>
                        <div class="error-message">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    
                    <form class="login-form" action="dang-ki" method="post">
                        <input type="text" class="auth-form-input" placeholder="Tên đăng nhập" name="tenDangKi" required>
                        <input type="email" class="auth-form-input" placeholder="Email" name="emailDangKi" required>
                        <div class="input-icon">
                            <input type="password" class="auth-form-input" placeholder="Mật khẩu" name="passDangKi" required>
                            <i class="fa fa-eye show-password"></i>
                        </div>
                        <input type="password" class="auth-form-input" placeholder="Nhập lại mật khẩu" name="passDangKi2" required>
                        <input type="text" class="auth-form-input" placeholder="Họ và tên" name="hoTen" required>
                        <input type="tel" class="auth-form-input" placeholder="Số điện thoại" name="soDienThoai" required>
                        <input type="text" class="auth-form-input" placeholder="Địa chỉ" name="diaChi" required>
                        <label class="btn active">
                            <input type="checkbox" name='email1' checked required>
                            <i class="fa fa-square-o"></i><i class="fa fa-check-square-o"></i> 
                            <span> Tôi đồng ý với <a href="#">Điều khoản</a> và <a href="#">Chính sách bảo mật</a>.</span>
                        </label>
                        <div class="footer-action">
                            <input type="submit" value="Đăng ký" class="auth-submit">
                            <a href="login.jsp" class="auth-btn-direct">Đăng nhập</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="auth-action-right">
                <div class="auth-image">
                    <img src="assetsdangnhap/vector.png" alt="login">
                </div>
            </div>
        </div>
    </div>
    <script src="jsdangnhap/common.js"></script>
</body>
</html>