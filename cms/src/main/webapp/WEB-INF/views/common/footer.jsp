<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.ui.inverted.segment {
	background: white;
	color: black;
	margin-top: 1em;
}
.ui.center.aligned.container {
	margin: 0px !important;
	width: 100%;
}
.ui.stackable.inverted.divided.grid {
	border-top: 1px solid rgba(34,36,38,.15);
	border-bottom: 1px solid rgba(34,36,38,.15);
}
#footerArea {
	display: flex;
	justify-content: center;
	align-items: center;
}
.ui.inverted.link.list > a.item {
	color: black;
}
.ui.inverted.link.list>a.item:hover{
	color: #4183c4 !important;
}
</style>
	<div class="ui inverted vertical footer segment">
		<div class="ui center aligned container">
			<div class="ui stackable inverted divided grid">
				<div class="four wide column">
					<div class="ui inverted link list">
						<a href="#" class="item">내담씨앤씨 안내</a>
					</div>
				</div>
				<div class="four wide column">
					<div class="ui inverted link list">
						<a href="#" class="item">이용약관</a>
					</div>
				</div>
				<div class="four wide column">
					<div class="ui inverted link list">
						<a href="#" class="item">개인정보처리방침</a>
					</div>
				</div>
				<div class="four wide column">
					<div class="ui inverted link list">
						<a href="#" class="item">사이트맵</a>
					</div>
				</div>
			</div>
			<div class="ui horizontal inverted small divided link list"
				id="footerArea">
				<div>
					<img src="resources/images/logo_color.png">
				</div>
				<div>
					<ul style="list-style: none; text-align: left;">
						<li>내담C&C | ㈜내담씨앤씨 all fight reserved.</li>
						<li>본사 주소 : 경기도 성남시 분당구 판교역로 231, S동 711호(삼평동, 에이치스퀘어)</li>
						<li>지사 주소 : 서울시 금천구 벚꽃로 298 대륭포스트타워6차 612호(가산동 50-3)</li>
						<li>대표전화 : 02-2083-5590 / FAX : 02-2083-5594</li>
					</ul>
				</div>
			</div>
		</div>
	</div>