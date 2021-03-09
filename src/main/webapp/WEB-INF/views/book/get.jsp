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

						<form action="/board/list" method="get" id="searchForm"
							style="margin: 0 0 10px">
							<div class="input-group"
								style="width: 15px 0; justify-content: center">
								<tr>
									<td class="fixed">수량</td>
									<td class="fixed"><select style="width: 60px;"
										id="order_book_qty">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
									</select></td>
								</tr>
							</div>
						</form>

						<div class="card-body">
							<a href="#" class="btn btn-success">장바구니 추가</a> <a href="#"
								class="btn btn-warning">바로 구매하기</a>

						</div>
					</div>
					<!-- /.card -->

				</div>
				<!-- /.col-lg-9 -->

			</div>

		</div>
		</div>
</main>

<%@ include file="../includes/f2.jsp"%>