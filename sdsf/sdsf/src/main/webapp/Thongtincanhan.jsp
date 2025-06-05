<%@page import="model.Quyen"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="icon" type="image/png" href="images/icons/logo1.png"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Cá Nhân</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Montserrat:wght@600&family=Open+Sans&family=Playfair+Display&family=Roboto&family=Roboto+Slab&display=swap" rel="stylesheet">

    <style>
        /* Reset chung */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Open Sans', Arial, sans-serif;
            font-size: 16px;
            line-height: 1.6;
            color: #0d3b66;
            background-color: #f0f4f8;
            text-align: center;
            padding: 20px 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Header */
        header {
            background-color: #ffffff;
            padding: 40px 20px 20px;
            border-radius: 15px;
            margin-top: 30px;
            box-shadow: 0 4px 10px rgba(13, 59, 102, 0.1);
        }

        header h1 {
            font-family: 'Merriweather', serif;
            font-size: 3rem;
            font-weight: 700;
            color: #0d3b66;
            letter-spacing: 2px;
            text-transform: uppercase;
            border-bottom: 3px solid #0d3b66;
            display: inline-block;
            padding-bottom: 10px;
            margin-bottom: 0;
        }

        /* Card thông tin cá nhân */
        .profile-card {
            background-color: #ffffff;
            box-shadow: 0 10px 30px rgba(13, 59, 102, 0.1);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin-top: 40px;
            padding: 30px;
            border-radius: 15px;
            transition: transform 0.3s ease-in-out;
        }

        .profile-card:hover {
            transform: scale(1.03);
        }

        .avatar {
            border-radius: 50%;
            width: 180px;
            height: 180px;
            margin-right: 30px;
            border: 5px solid #a3cef1;
            box-shadow: 0 0 20px rgba(0, 103, 178, 0.2);
            object-fit: cover;
        }

        .profile-info {
            max-width: 500px;
            color: #044e89;
            text-align: left;
        }

        .profile-info h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: #023047;
        }

        .profile-info p {
            font-family: 'Roboto', sans-serif;
            font-size: 1.1rem;
            margin: 10px 0;
            line-height: 1.5;
            color: #044e89;
        }

        .profile-info strong {
            font-family: 'Roboto Slab', serif;
            color: #0077b6;
        }

        /* Buttons */
        .btn {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 1rem;
            background-color: #0077b6;
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 25px;
            cursor: pointer;
            margin: 15px 10px 0 0;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #023e8a;
        }

        /* Footer */
        footer {
            background-color: #ffffff;
            color: #044e89;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
            font-size: 1.1rem;
            border-top: 3px solid #a3cef1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-card {
                flex-direction: column;
                padding: 20px;
            }

            .avatar {
                margin: 0 0 20px;
            }

            .profile-info {
                text-align: center;
                max-width: 100%;
            }

            header h1 {
                font-size: 2.2rem;
                letter-spacing: 1.5px;
            }

            .profile-info h2 {
                font-size: 1.8rem;
            }

            .profile-info p {
                font-size: 1rem;
            }

            .btn {
                font-size: 0.95rem;
                padding: 10px 24px;
                margin: 12px 5px 0 0;
            }
        }

        @media (max-width: 480px) {
            header h1 {
                font-size: 1.6rem;
                letter-spacing: 1px;
            }

            .profile-info h2 {
                font-size: 1.4rem;
            }

            .profile-info p {
                font-size: 0.95rem;
            }

            .btn {
                font-size: 0.9rem;
                padding: 8px 20px;
                margin: 10px 5px 0 0;
            }
        }
    </style>
</head>
<body>

    <header>
        <div class="container">
            <h1>Thông Tin Cá Nhân</h1>
        </div>
    </header>

    <%
        HttpSession Session = request.getSession(false);
        if (session == null || session.getAttribute("Ghinhotaikhoan") == null) {
    %>
        <script>
            alert("Vui lòng đăng nhập để xem thông tin");
            window.location.href = "login.jsp";
        </script>
    <%
        } else {
            List<User> l = (List<User>) session.getAttribute("Ghinhotaikhoan");
            // Lấy user đầu tiên trong danh sách để hiển thị avatar (nếu có)
            User u = l.isEmpty() ? null : l.get(0);
    %>

    <main>
        <div class="container profile-card">


            <div style="display: flex; flex-direction: column; align-items: center; margin-right: 30px;">
                <img src="<%= (u != null && u.getAvatar() != null && !u.getAvatar().isEmpty()) ? u.getAvatar() : "images/Avatar.png" %>" alt="Avatar" class="avatar">

                <!-- Form upload avatar nằm ngay dưới ảnh -->
                <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data">
                    <input type="file" name="avatar" accept="image/*" required style="margin-top: 20px;">
                    <br>
                    <button class="btn" type="submit">Tải ảnh đại diện mới</button>
                </form>
            </div>



            <div class="profile-info">
                <%
                    for (User user : l) {
                %>
                    <h2><%= user.getHoTen() %></h2>
                    <p><strong>Tuổi:</strong> 20</p>
                    <p><strong>Số điện thoại:</strong> <%= user.getSoDienThoai() %></p>
                    <p><strong>Email:</strong> <%= user.getEmail() %></p>
                    <p><strong>Quê quán:</strong> <%= user.getDiaChi() %></p>
                    <p><strong>Quyền:</strong> <%= (user.getMaQuyen() == 1) ? "Quản trị viên" : "Khách hàng" %></p>
                <%
                    }
                %>

                <a href="https://www.facebook.com/groups/1379338390026083" class="btn">Liên hệ</a>
                <button class="btn" onclick="goBack()">Quay lại</button>
                <a href="Doimatkhau.jsp" class="btn">Đổi mật khẩu</a>
            </div>
        </div>
    </main>

    <%
        } // end else session not null
    %>

    <footer>
        <div class="container">
            <p>&copy; 2025 Thông Tin Cá Nhân | Designed by Group 8</p>
        </div>
    </footer>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>
