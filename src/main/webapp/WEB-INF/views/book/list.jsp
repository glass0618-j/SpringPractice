<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/h2.jsp"%>
<main>
<div class="row" style="justify-content: space-around ; margin: 1px"  >
        
        <c:forEach items="${list }" var="bookList">
		<div class="col-lg-3 col-md-5 mb-3" style="text-align: center ; padding: 0 5px">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src= "${bookList.fileName}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/book/get?book_id=${bookList.book_id }">${bookList.book_title }</a>
                </h4>
                <h5> <fmt:setLocale value="ko_KR"/><fmt:formatNumber value="${bookList.book_price }" type="currency"></fmt:formatNumber></h5>
                <p class="card-text">${bookList.book_intro }</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
          </c:forEach>

          </div>
</main>
<%@ include file="../includes/f2.jsp"%>