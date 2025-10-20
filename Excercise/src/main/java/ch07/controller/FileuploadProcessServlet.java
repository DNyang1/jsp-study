package ch07.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@WebServlet("/fileuploadProcess")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) -> 이 크기 초과 시 디스크에 임시 저장
	    maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB)
	    maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB)
)
public class FileuploadProcessServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public FileuploadProcessServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.getWriter().append("Served at: ").append(req.getContextPath());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String uploadPath = "D:/upload";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
	
		Collection<Part> fileParts = req.getParts();
		
		int fileCount = 1;
		for (Part part : fileParts) {
			if (part.getName().startsWith("uploadFile")) {
				String fileName = part.getSubmittedFileName();
				
				// 파일만 필터링 방법-2
				// fileName은 파일 필드가 아닌 일반 폼 필드에서는 항상 Null 발생
				if (fileName == null || fileName.isEmpty()) continue;
				
				String uniqueName = UUID.randomUUID().toString() + "_" + fileName;
				
				part.write(uploadPath + File.separator + uniqueName);
				out.println("업로드된 파일 " + fileCount + " : " + uniqueName + "<br>");
				fileCount++;
						
				
				
			}
		}
		
		
		
	}
	
	
}

