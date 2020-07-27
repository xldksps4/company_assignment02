<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 프로필 이미지용 모달 -->
	<div class="ui modal" id="profileImgModal">

		<div class="header">프로필 사진</div>
		<div class="image content" style="justify-content: center;">
			<div class="ui medium image modal-image">
				<h4 class="ui header">이전 사진</h4>
				<img src="resources/images/noImage.png" id="oldImg">
			</div>

			<div style="font-size: xx-large; margin: 1em; margin-top: 5em;">
				<i class="fas fa-arrow-right"></i>
			</div>

			<div class="ui medium image modal-image" id="modyImgArea"
				data-tooltip="클릭해서 이미지 등록하기" data-position="left center"
				onclick="modyProfile()">
				<h4 class="ui header">변경 사진</h4>
				<img src="resources/images/noImage.png" id="modyProfileImg">
			</div>
		</div>

		<div class="actions">
			<div class="ui green button" onclick="checkProfile()">등록</div>
			<div class="ui black deny button" onclick="formEmpty()">취소</div>
		</div>
	</div>