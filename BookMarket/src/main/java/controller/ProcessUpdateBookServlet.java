package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class ProcessUpdateBookServlet
 */
@WebServlet("/processUpdateBook")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB)
	maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB)
	maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB)
)
public class ProcessUpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// ==== 일반 텍스트 데이터 처리 ====
		String bookId = request.getParameter("bookId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String releaseDate = request.getParameter("releaseDate");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition");
		String oldFileName = request.getParameter("oldFileName"); // 기존 파일명(hidden input)

		int price = 0;
		if (unitPrice != null && !unitPrice.isEmpty()) {
			price = Integer.parseInt(unitPrice);
		}

		long stock = 0;
		if (unitsInStock != null && !unitsInStock.isEmpty()) {
			stock = Long.parseLong(unitsInStock);
		}

		Part filePart = request.getPart("bookImage");
		String fileName = oldFileName;

		if (filePart != null && filePart.getSize() > 0) {
			fileName = filePart.getSubmittedFileName();

			String uploadPath = "D:/upload";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			filePart.write(uploadPath + File.separator + fileName);
		}

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE book SET "
				+ "b_name = ?, "
				+ "b_unitPrice = ?, "
				+ "b_author = ?, "
				+ "b_description = ?, "
				+ "b_publisher = ?, "
				+ "b_category = ?, "
				+ "b_unitsInStock = ?, "
				+ "b_releaseDate = ?, "
				+ "b_condition = ?, "
				+ "b_fileName = ? "
				+ "WHERE b_id = ?";

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
			System.out.println("수정됨");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("수정안됐음" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 수정 후 도서 목록 페이지로 리다이렉트
		response.sendRedirect("editBook.jsp?edit=update");
	}
}
