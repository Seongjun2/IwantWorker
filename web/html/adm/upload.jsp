<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.Enumeration" %>
<%@ page import="file.FileManager" %>
<%@ page import="DAO.BannerDAO" %>
<%@ page import="DAO.BannerDAO_Impl" %>
<%@ page import="VO.BannerVO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
    String uploadPath = request.getServletContext().getRealPath("/uploadImg");
    System.out.println(uploadPath);

    BannerDAO bannerDAO = new BannerDAO_Impl();
    BannerVO bannerVO = new BannerVO();
    FileManager fileManager = new FileManager();

    fileManager.removeAll(uploadPath);//서버에 이미지 파일 모두 삭제
    bannerDAO.removeAll();//table의 data 모두 삭제

    MultipartRequest mpr = new MultipartRequest(//이미지 업로드
            request, uploadPath, 1024*1024*20, "UTF-8", new DefaultFileRenamePolicy()
    );

    Enumeration files = mpr.getFileNames();

    for (Enumeration  e = mpr.getFileNames(); e.hasMoreElements() ;) {//데이터 베이스 삽입.
        String strName = (String) e.nextElement();
        String fileName= mpr.getFilesystemName(strName);
        if (fileName != null) {
            bannerVO.setImage(fileName);
        }
        bannerDAO.add(bannerVO);
    }
//    bannerDAO.findAll();//테스트
    response.sendRedirect("./userList_Admin.jsp");

%>
<html>
<head>
    <title>upload</title>
</head>
<body>

</body>
</html>
