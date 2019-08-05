<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="file.FileManager" %>
<%@ page import="DAO.BannerDAO" %>
<%@ page import="DAO.BannerDAO_Impl" %>
<%@ page import="VO.BannerVO" %>
<%

    String uploadPath = request.getServletContext().getRealPath("/WEB-INF/uploadImg");
    FileManager fileManager = new FileManager();
    fileManager.removeAll(uploadPath);

    System.out.println(("절대경로 : " + uploadPath));

    MultipartRequest mpr = new MultipartRequest(
            request, uploadPath, 1024*1024*20, "UTF-8", new DefaultFileRenamePolicy()
    );

    Enumeration files = mpr.getFileNames();

    BannerDAO bannerDAO = new BannerDAO_Impl();
    BannerVO bannerVO = new BannerVO();

    for (Enumeration  e = mpr.getFileNames(); e.hasMoreElements() ;) {
        String strName = (String) e.nextElement();
        String fileName= mpr.getFilesystemName(strName);
        if (fileName != null) {
            System.out.println("strName : " +strName);
            System.out.println("fileName : " + fileName);
            bannerVO.setImage(fileName);
        }
    }

//    bannerDAO.add();

    //MultipartRequest를 쓰면 request.getParameter 못씀
    // 대신 MultipartRequest 안에 있는 getParameter 써야 함.
    // 한글 처리도 내부에서 해줌.

%>
<html>
<head>
    <title>upload</title>
</head>
<body>

</body>
</html>
