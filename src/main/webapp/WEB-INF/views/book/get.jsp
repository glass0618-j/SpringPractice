<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/h2.jsp"%>
<main>

	<!-- Page Content -->
	<div class="container">

		<div class="row" style="justify-content: center">

			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center; width: 800px">

				<div class="card mt-4">
					<img class="card-img-top" src="${book.fileName}" alt="">
					<div class="card-body">
						<h4 class="card-title">
							<a href="/book/get?book_id=${book.book_id }">${book.book_title }</a>
						</h4>
						<h5>
							<fmt:setLocale value="ko_KR" />
							<fmt:formatNumber value="${book.book_price }" type="currency"></fmt:formatNumber>
						</h5>
						<p class="card-text">${book.book_intro }</p>

						
							<div class="input-group"
								style="width: 15px 0; justify-content: center">
								<tr>
									<td class="fixed">수량</td>
									<td class="fixed">
									<form action="/cart/list" method="get" id="searchForm" style="margin: 0 0 10px">
									<input type="hidden" name="book_id" value="book.book_id">
									<select style="width: 60px;" id="book_amount" name="book_amount">
											<c:forEach begin="1" end="10" var="i">
												<option value = "${1 }">${i }</option>
											</c:forEach>
									</select>&nbsp;개
									<input type="submit" value="장바구니 추가" onclick="check_cart()" class="btn btn-warning">
									</form>
									</td>
									
								</tr>
							</div>
									<button name="cart" onclick="check_cart" class="btn btn-success ">바로 구매</button>

						<div class="card-body">
						</div>
						
					</div>
					<!-- /.card -->

				</div>
				<!-- /.col-lg-9 -->

			</div>

		</div>
		</div>
</main>
<script type="text/javascript">
function check_cart(){ 
	alert('상품이 장바구니에 담겼습니다.'); 
}

</script>

<%@ include file="../includes/f2.jsp"%>