<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:if test="${param.menu=='manage' }">
<title>��ǰ �����ȸ</title>
 </c:if>
 <c:if test="${param.menu=='search' }">
 <title>��ǰ ����</title>
 </c:if>	

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetPageList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action", "/product/listProduct?menu=${param.menu }" ).submit();
}

$(function() {
	
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			fncGetPageList(1);
		});
	 $(".ct_input_g").keypress(function(event){
			if (event.which==13) {
				fncGetPageList(1);
			}
			return;
		})
	 
	 $(".ct_list_pop:nth-child(2n+1)" ).css("background-color" , "whitesmoke");
	
});
/* $(function() {
	
	$("#prodNAME ").on("click" , function(){
	var prodNo = $(this).data("param");
	if ( ${param.menu=="search"}) {
		self.location = "/product/getProduct?prodNo="+prodNo+"&menu=search";
	};

	if ( ${param.menu=="manage"}) {
		self.location = "/product/updateProduct?prodNo="+prodNo+"&menu=manage";
	};
	});
});
 */
 $(function() {
		/* $(".ct_list_pop td:nth-child(5) ").on("click" , function(){ */
			$("#prodFile ").on("click" , function(){
			var prodNo = $(this).data("param1");
			if ( ${param.menu=="search"}) {
				self.location = "/product/getProduct?prodNo="+prodNo+"&menu=search";
			};

			if ( ${param.menu=="manage"}) {
				self.location = "/product/updateProduct?prodNo="+prodNo+"&menu=manage";
			};
			});
	 });

$(function() {
	$( "input[name='order']" ).on("click" , function() {
		
						fncGetPageList(1);
});
	
	//==========================
	$("#prodNAME ").on("click" , function(){
	var prodNo = $(this).data("param");
	var prodName = $(this).text().trim();
	$.ajax(
			{
				url : "/product/json/getProduct/"+prodNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					var displayValue = "<h3>"
						+"��ǰ�̹��� : "+"<img src='/images/uploadFiles/ "+JSONData.fileName+"' width='300' height='280' align='absmiddle'/>"+"<br/>"
						+"��ǰ�� : "+JSONData.prodName+"<br/>"
						+"���� : "+JSONData.price+"<br/>"
						+"��ǰ ������ : "+JSONData.prodDetail+"<br/>"
						+"�ܿ� : "+JSONData.stock+"<br/>"
						+"</h3>";
					$("h3").remove();
					$( "#"+prodName+"" ).html(displayValue);
					
				}
			});
	});
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:if test="${param.menu== 'search'}">
						��ǰ �����ȸ
					</c:if>
					<c:if test="${param.menu=='manage' }">
						 ��ǰ ����
				 	</c:if>	
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="right">
			<input type = "radio" name="order" id="fkfk" value="priceDesc" ${search.order=='priceDesc' ? "checked" : "" }/>�������ݼ�
			<input type="radio" name="order" value = "priceAsc" ${search.order=='priceAsc' ? "checked" : "" }/>�������ݼ�
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<c:if test="${!empty user && user.role == 'admin' }">
				<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				</c:if>
				<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input 	type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword	 : "" }"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}     ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">No</td>
		<td class="ct_line02"></td>
		<c:if test="${!empty user && user.role == 'admin' }">
		<td class="ct_list_b" width="50">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		</c:if>
		<td class="ct_list_b" width="150">��ǰ�̹���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >��ǰ�󼼼���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b"  width="150">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�������</td>
		<td class="ct_line02"></td>	
	</tr>
	<tr>
		<td colspan="15" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="product" items="${list}">
			<c:set var ="i" value="${i+1 }"/>
		
	<tr class="ct_list_pop">
		<td align="center">${i }</td>
		<td></td>
		<c:if test="${!empty user && user.role == 'admin' }">
		<td align="left">${product.prodNo}</td>
		<td></td>
		</c:if>
		<td id="prodFile" data-param1="${product.prodNo}">
			<img src="/images/uploadFiles/${product.fileName}" width="100" height="80" align="absmiddle"/>
		</td>
		</td>	
		<td></td>
		<td align="left"  id="prodNAME" data-param="${product.prodNo }       ">
			${product.prodName }
		<td></td>
		<td align="left">${product.prodDetail }</td>
		<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.manuDate }</td>
		<td></td>
		<td align="left">
		<c:if test = "${product.stock =='0'}">������</c:if>
		<c:if test = "${product.stock !='0'}">�ǸŰ���</c:if>
		<%-- 
		<c:if test="${!empty user && user.role == 'admin' }">
		
			<c:if test="${param.menu=='manage' }">
			<c:choose>
				<c:when test = "${product.proTranCode =='1  '}">���ſϷ�<a href="/purchase/updateTranCodeActionByProd?prodNo=${product.prodNo}&tranCode=2&currentPage=${resultPage.currentPage}">����ϱ�</a></c:when>
				<c:when test = "${product.proTranCode =='2  '}">�����</c:when>
				<c:when test = "${product.proTranCode =='3  '}">��ۿϷ�</c:when>
	
				<c:otherwise>�Ǹ���	</c:otherwise>
			</c:choose>
					
				</c:if>
		
			<c:if test = "${param.menu=='search' }">
				<c:choose>
				<c:when test = "${product.proTranCode =='1  '}">���ſϷ�</c:when>
				<c:when test = "${product.proTranCode =='2  '}">�����</c:when>
				<c:when test = "${product.proTranCode =='3  '}">��ۿϷ�</c:when>
				<c:otherwise>�Ǹ���	</c:otherwise>
			</c:choose>
			</c:if>
			</c:if>
			
			else if(request.getParameter("menu").equals("search")) {%>
				<%=vo.getProTranCode() %>
			<%} %>
		<%}
		<!-- else if(!role.equals("admin")){ %> -->
		<%if(request.getParameter("menu").equals("search")){ %>
		<%if(vo.getProTranCode().equals("�Ǹ���")){ %>
		<%=vo.getProTranCode() %>
		<%}else{ %>
			<%} %>
			<%} %>
				<%} %>
		<c:if test="${!empty user && user.role != 'admin' }">	
			<c:if test="${param.menu=='search' }">	
				<c:if test="${product.proTranCode != '0  '}" >			
				<c:choose>
				<c:when test = "${product.proTranCode =='1  '}">���ſϷ�</c:when>
				<c:when test = "${product.proTranCode =='2  '}">�����</c:when>
				<c:when test = "${product.proTranCode =='3  '}">��ۿϷ�</c:when>
				<c:otherwise>�Ǹ���	</c:otherwise>
			</c:choose>				
				</c:if>			
			</c:if>
		</c:if>	 --%>
		</td>
	</tr>
	<tr>
			<td id="${product.prodName}" colspan="15" bgcolor="D6D7D6" height="1"></td>
		</tr>
	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
		 <jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
