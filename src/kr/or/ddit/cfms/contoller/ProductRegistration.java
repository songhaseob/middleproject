package kr.or.ddit.cfms.contoller;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.FileDetailVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;
import javax.servlet.http.Part;

@WebServlet("/productRegistration.do")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 
maxFileSize=1024*1024*30, maxRequestSize=1024*1024*50)
public class ProductRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final String UPLOAD_DIR_GIFT = "uploadGift";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		request.setCharacterEncoding("UTF-8");
		
		String id= request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String pname = request.getParameter("pname");
		int rprice = Integer.parseInt(request.getParameter("rprice"));
		int sprice = Integer.parseInt(request.getParameter("sprice"));
		String cont = request.getParameter("cont");
		
		
		System.out.println(category);
		System.out.println(brand);
		System.out.println(pname);
		System.out.println(rprice);
		System.out.println(sprice);
		System.out.println(cont);
		
		
		ProlistVO listVo = new ProlistVO();
		listVo.setCus_id(id);
		listVo.setCont(cont);
		listVo.setWriter(name);
		
		ProductVO proVo = new ProductVO();
		proVo.setCus_id(id);
		proVo.setPro_cg(category);
		proVo.setBrand(brand);
		proVo.setPro_nm(pname);
		proVo.setPro_pr(sprice);
		proVo.setRet_pr(rprice);
		
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		
		int cnt = service.insertProlist(listVo);
		
		request.setAttribute("result", cnt);
		
		int cnt2 = service.insertProduct(proVo);
		
		request.setAttribute("result2", cnt2);
		
		
		/*"D:/D_Other";*/

		/*"D:/A_TeachingMaterial/4.MiddleProject/workspace/CFMS/WebContent";*/
		String applicationPath = "D:/D_Other";


		

		//String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
		String uploadPathGift = applicationPath + File.separator + UPLOAD_DIR_GIFT;
		//String uploadPath = "D:/D_Other/uploadFiles";
		
		// 저장된 폴더가 없으면 새로 생성한다.
		
		File uploadDirGift = new File(uploadPathGift);
		if(!uploadDirGift.exists()) {
			uploadDirGift.mkdirs();
		}
		
		
		// 파일이 아닌 데이터는 getParameter()메서드나 getParameterValues()메서드를 이용해서 구한다.
		request.setCharacterEncoding("UTF-8");
		//String memId = request.getParameter("memid");
		//System.out.println("파일이 아닌 데이터 : " + memId);
		
		//------------------------------------------------------
		String fileName = "";	//	파일명이 저장될 변수
		List<FileDetailVO> fileList = new ArrayList<>();	//	업로드한 파일 정보가 저장될 List 생성
		
		/*
		- Servlet 3.0이상에 새롭게 추가된 파일 Upload용 메서드들
		1. request.getParts(); ==> part객체의 컬렉션을 반환한다.
		2. request.getPart("Part이름");	==> 지정된 이름을 가진 개별 Part객체를 반환한다.
		
		-- Part객체의 구조 --
		1. 파일이 아닐 경우
		--------asgasgkwogk		==> Part를 구분하는 구분선
		Content-Disposition: form-data; name="memid"		==> 파라미터 명
						==> 빈줄
		a001			==> 파라미터값
		
		
		2. 파일일 경우
		--------asgasgkwogk		==> Part를 구분하는 구분선
		Content-Disposition: form-data; name="file1"; filename="파일명"	==> 파일 정보
		Content-Type: text/plain	==>	파일 종류
						==> 빈줄
		asfjij124		==> 파일 내용		
		
		*/
		int giftCode = service.checkProductNum();
		System.out.println(giftCode);
		for(Part part : request.getParts()) {
			
			fileName = extractFileName(part); // 파일명 구하기
			// 파일명이 공백("")이면 이것은 파일이 아닌 일반 파라미터라는 의미이다.
			if(!"".equals(fileName)) {
				// 1개의 업로드 파일 정보를 저장할 객체 생성
				FileDetailVO detail = new FileDetailVO();
				
				detail.setFileName(fileName);
				detail.setFileSize((long)Math.ceil(part.getSize()/1024.0));
			
				try {
					part.write(uploadPathGift+File.separator+giftCode+".jpg"); // 파일 저장하기
					detail.setUploadStatus("Success");
				} catch (IOException e) {
					detail.setUploadStatus("Fail : "+e.getMessage());
				}
				fileList.add(detail); // 파일 정보를 저장한 객체 1개를 List에 추가
			} // if문 끝
		} // for문 끝
		
		request.setAttribute("uploadFiles", fileList);
		
		
		CustomerVO custVo = service.userInfo(id);
		
		request.setAttribute("userinfo", custVo);
		
		List<ProlistVO> prolist = service.getAllProList(); 
		
		request.setAttribute("prolist", prolist);
		
		List<ProductVO> prodlist = service.getAllProdList();
		
		request.setAttribute("prodlist", prodlist);
		
					
		
		request.getRequestDispatcher("board/empty_information.jsp").forward(request, response);
		
		
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private String extractFileName(Part part) {
		String fileName = "";
		String contentDisposition = part.getHeader("Content-Disposition");
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				// filename="test.txt"
				fileName = item.substring(item.indexOf("=")+2,item.length()-1);
				System.out.println(fileName);
			}
		}
		
		return fileName;
	}

	
}
