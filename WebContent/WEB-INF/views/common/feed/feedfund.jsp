<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.content-wrapper>#feedwrap{
	height:1300px;
}
.content-wrapper>#feedwrap>#feedhead{
	height:200px;
	background-color:rgba(100, 183, 0, 0.75);
	position:relative;
}
.content-wrapper>#feedwrap>#userimg{
	border:1px solid black;
	height:150px;
	width:150px;
	display:inline-block;
	border-radius: 50%;
	position:absolute;
	top:150px;
	left:300px;
}
.content-wrapper>#feedwrap>#feedbody>#follow{
	display:flex;
}
.content-wrapper>#feedwrap>#feedbody>#body-title{
	display:flex;
	margin-left:500px;
}
</style>
<div class="content-wrapper">
	<div id="feedwrap" class="col-md-12">
	<div id="feedhead"class="col-md-12">
	</div>
		<div id="userimg" class="col-sm-3">${member_img }</div>
	<div id="feedbody" class="col-md-12">
		<div id="follow"class="col-md-12" style="margin-bottom:10px;text-align:center;">
		<div id="name"class="col-md-7" style="font-size:1.5rem;margin:30px;">${member_nic }닉네임자리
		<div id="pr" class="col-md-6" style="font-size:1rem;text-align:right;">소개</div>
		</div>
		</div>
		<div class="col-md-12" style="display:flex;justify-content:left;margin-bottom:30px;">
			<div class="col-sm-1" style="margin-left:430px;"><a href="#">구독자</a>
			<div>숫자</div></div>
			<div class="col-sm-1"><a href="#">관심작가</a>
			<div>숫자</div></div>
			<div style="margin-left:600px;">
				<input id="fbutton"type="submit" class="btn " value="구독" style="background-color: rgba(100, 183, 0, 0.75);color:white;"/>		
			</div>
		</div>
			<hr/>
			<div id="body-title"class="col-md-10">
				<div class="col-md-4"><a href="javascript:goPage(writer_feedwritelist);">글</a></div>
				<div class="col-md-4"><a href="javascript:goPage(writer_feedfundiglist);">펀딩</a></div>
			</div>
			<hr/>
			<div id="downwrap" >
      		<div id="content"class="row">
				<div class="col-12">
				
				<div id="card_body" class="card-body table-responsive p-0" >
					<ul id="fund_list"style="list-style-type:none;">
						<%-- <c:foreach> --%>
						<li id="fund_content" style="display:flex; justify-content:center;">
							<div id="title_img" style="height:80px; width:100px; border:1px solid black;margin:10px;">타이틀이미지자리</div>
							<div id="title" style="margin:30px;">제목자리</div>
							<div id="title_content" style="margin:50px;">간단한내용자리
							<div id="title_percent" style="display:block;">현재퍼센트</div>
							</div>
							<div id="writer_name" style="margin:30px;margin-left:100px;">작가명:${writer_name }
							<div id="d-day" style="margin:20px;">남은날짜 자리</div>
							</div>
						</li>
						<hr>
						<%-- <c:foreach> --%>
					</ul>
				</div>
				
				
				</div>
			</div>
      			
      		</div>
      		
      		 <nav aria-label="Page navigation example" style="display:flex; justify-content:center; ">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
	</div>
</div>