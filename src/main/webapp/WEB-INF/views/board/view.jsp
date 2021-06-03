<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cr" value="
" scope="application" />
<c:set var="br" value="<br/>" scope="application" />

<fmt:setBundle basename="jaemukyang.jdbc" />
<fmt:message key="url" var="url" />
<fmt:message key="drv" var="drv" />
<fmt:message key="usr" var="usr" />
<fmt:message key="pwd" var="pwd" />

<sql:setDataSource var="mariadb" url="${url}" driver="${drv}" user="${usr}" password="${pwd}" />

<sql:update dataSource="${mariadb}">
	update board set views = views +1
	where bdno = ?
	<sql:param value="${param.bdno}" />
</sql:update>

<sql:query var="rs" dataSource="${mariadb}" >
	select * from board
	where bdno = ?
	<sql:param value="${param.bdno}" />
</sql:query>

<h2>게시판 - 본문보기</h2>
<div id="view">
	<c:forEach var="r" items="${rs.rows}">
		<div><label>제목</label>
			<span>${r.title}</span>
		</div>
		<div><label>작성글 정보</label>
			<span>${r.userid} / ${r.regdate} / ${r.thumbup} / ${r.views}</span>
		</div>
		<div><label class="dragup">본문</label>
			<span class="contents">${fn:replace(r.contents, cr, br)}</span>
		</div>
	</c:forEach>
	
	<div><label></label>
		<button type="button" id="listbtn">목록으로</button>
	</div>
</div>

<script>
	var listbtn = document.getElementById("listbtn");
	listbtn.addEventListener("click", go2list);
	
	function go2list() {
		location.href="/mvc/board/list";
	}
</script>