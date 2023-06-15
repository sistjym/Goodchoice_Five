package com.five.goodchoice.reservation.model;

import java.util.Map;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class ReservationDAO implements InterReservationDAO {

   
   @Resource
   private SqlSessionTemplate sqlsession; // 로컬 DB mymvc_user에 연결 
   // Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의  sqlsession bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.
   
   
   // 결제가 성공적으로 이루어지면 예약테이블에 정보 넣기 
   @Override
   public int insertReservationInfo(Map<String, String> paraMap) {
      int n = sqlsession.insert("reservation.insertReservationInfo", paraMap);
      return n;
   }

   // 사용한 초인트 뻬고 적립될 포인트 더하기
   @Override
   
   public int updatePoint(Map<String, String> paraMap) {
	   
	   int n = sqlsession.update("reservation.updatePoint", paraMap);
	   System.out.println("테이블 인서트" + n);
      return n;
   }

}