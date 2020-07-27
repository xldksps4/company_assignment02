<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	#side-right-nav {
		position: fixed;
		bottom: 143px;
		right: 10px;
		z-index: 1000;
	}
	#side-right-nav div {
		margin-bottom: 1em;
		background: white;
	}
	.sideBtn {
		padding: 1em !important;
	}
</style>
	<div id="side-right-nav">
		<div class="column">
			<button class="ui primary basic button sideBtn" onclick="javascript:window.scrollTo(0,0)">▲</button>
		</div>
		<div class="column">
			<button class="ui primary basic button sideBtn" onclick="javascript:window.scrollTo(0, document.body.scrollHeight)">▼</button>
		</div>
	</div>