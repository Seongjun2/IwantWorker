<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%>
<%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_write.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">구인 게시글 작성</h3>
    </div>
    <span class="div_mainDiv">
        <div id="posting">
            <form method="POST" action="post_add.jsp">
                <div style="width: 30%; float: left">
                    <ul>
                        <li>제목</li>
                        <li>모집기간</li>
                        <li>작물</li>
                        <li>작업종류</li>
                        <li>일급</li>
                        <li>위치</li>
                    </ul>
                </div>
                <div style="width: 70%; float: left">
                    <ul>
                        <li>
                            <div style="width: 100%; float: left">
                                <input type="text" size="100px" name="title" style="width: 80%"/>
                            </div>
                            <br />
                        </li>
                        <li>
                            <div>
                                <input type="date" name="startDate" class="date"/>
                                 ~ <input type="date" name="endDate" class="date"/>
                            </div>
                        </li>
                        <li>
                            <div>
                                <select name="crop">
                                    <option value="귤">귤</option>
                                    <option value="한라봉">한라봉</option>
                                    <option value="천해향">천해향</option>
                                    <option value="마늘">마늘</option>
                                    <option value="감자">감자</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <div>
                                <select name="workType">
                                    <option value="수확">수확</option>
                                    <option value="운반">운반</option>
                                    <option value="판별">판별</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <div style="width: 100%; float: left">
                                <input type="text" size="100px" name="title" style="text-align:right; width: 73%"/> 원
                            </div>
                            <br />
                        </li>
                        <li>
                            <div style="width: 100%; float: left">
                                <input type="text" size="100px" name="title" style="width: 80%" value="읍면리"/>
                            </div>
                            <br />
                        </li>
                    </ul>
                </div>
                <br />
                <hr>
                <div class="content">
                    <span>내용</span>
                    <div style="padding-top: 30px">
                       <input type="textarea" name="content" style="width: 100%; height: 20%" wrap="hard"/>
                    </div>
                </div>
            </form>
        </div>
    </span>
</main>
<%@include file="./../footer.jsp"%>