<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<%@ include file="../naviBar.jsp"%>
<%@ include file="wHeader.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">

			<br> <br> <br> <br>

			<div class="alert alert-info"> ${where} 게시글 수정</div>
			<!-- /.row -->
			<br>

			<form name="form" action="ContentUpdate" method="post">
				<input name="writer" class="form-control" value=${vo.writer} readonly />
				<textarea name="title" rows=1 class="form-control">${vo.title}</textarea>
				<textarea name="content" id="summernote" >${vo.content}</textarea>
				<br> <input type="hidden" name="where" value="${where}">
				<input type="hidden" name="bno" value="${vo.bno}">
				<button type="button" id="btnWrite" class="btn btn-primary">수정완료</button>
			</form>


			<br> <br> <br>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			$("#btnWrite").click(function() {
				var title = document.form.title.value;
				var content = document.form.content.value;
				var writer = document.form.writer.value;
				//var title = $("#title").val();
				//var content = $("#content").val();
				//var writer = $("#writer").val();
				
				if (title == "") {
					alert("제목을 입력하세요");
					document.form.title.focus();
					return;
				}
				if (content == "") {
					alert("내용을 입력하세요");
					document.form.content.focus();
					return;
				}
										
				// 폼에 입력한 데이터를 서버로 전송
				document.form.submit();
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 400, // 에디터의 높이 
				minHeight : null,
				maxHeight : null,
				focus : true,
				lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
			});
		});
	</script>
</body>
</html>
