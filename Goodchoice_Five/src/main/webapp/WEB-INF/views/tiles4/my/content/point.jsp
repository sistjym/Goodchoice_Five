<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>
<script>
    function toggleButton(button) {
        // 선택된 버튼인 경우 클래스를 추가하고, 선택되지 않은 버튼인 경우 클래스를 제거합니다.
        if (button.classList.contains('btn-capsule--selected')) {
            button.classList.remove('btn-capsule--selected');
        } else {
            button.classList.add('btn-capsule--selected');
        }
    }
</script>
<div id="content" class="sub_wrap my_wrap">
    <main class="container align_rt">
        <input type="hidden" name="page" value="1"> 
        <h3 class="page-title pc-only">포인트</h3> 
        <header class="point-header">
            <div>
                <div class="points-summary">
                    <div class="upper-col">
                        <div class="heading-text">
                            <p class="heading-text__title">내 포인트</p>
                            <p class="heading-text__current-point">${sessionScope.loginuser.point} P</p>
                        </div> 
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" class="icon-info">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M17.5 10a7.5 7.5 0 11-15 0 7.5 7.5 0 0115 0zM11 6a1 1 0 11-2 0 1 1 0 012 0zm0 9V9H9v6h2z" fill="#000" fill-opacity=".8"></path>
                        </svg>
                    </div> 
                    <div class="lower-col">
                        <p class="notice-text">30일 내 <span class="font-weight--xb">0 P</span>가 소멸될 예정이에요.</p> 
                    </div>
                </div>
            </div> 
            <nav class="point-filter">
                <button class="btn-capsule btn-capsule--selected">
                    <span>전체</span>
                </button>
                <button class="btn-capsule btn-capsule--solid">
                    <span>적립</span>
                </button>
                <button class="btn-capsule btn-capsule--solid">
                    <span>사용</span>
                </button>
                <button class="btn-capsule btn-capsule--solid">
                    <span>소멸</span>
                </button>
            </nav>
        </header> 
        <section class="points-list"> 
            <c:if test="${not empty requestScope.memberPointList}">
                <table>
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>내용</th>
                            <th>포인트</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.memberPointList}" var="point">
                            <tr>
                                <td>${point.date}</td>
                                <td>${point.description}</td>
                                <td>${point.amount}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty requestScope.memberPointList}">
                <div style="text-align: center;">
                    <div style="margin-top: 100px;"><i class="fad fa-exclamation fa-5x"></i></div>
                    <span>포인트 지급/차감 내역이 없습니다.</span>
                </div>
            </c:if>
            <div class="points-list__notice-empty">
                	포인트 내역이 없어요
            </div>
        </section>
    </main> 
</div>