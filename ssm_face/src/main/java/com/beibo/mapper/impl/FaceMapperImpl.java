package com.beibo.mapper.impl;

import org.junit.Test;
import com.beibo.mapper.FaceMapper;
import com.beibo.pojo.Face;
import com.beibo.service.FaceService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;
import java.util.List;

public class FaceMapperImpl implements FaceMapper {

    @Resource
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Face> selectAllUsers() {
        SqlSession sqlSession = sqlSessionFactory.openSession();

        List<Face> face = null;

        face = sqlSession.selectList(Face.class.getName() + ".selectAllUsers");


        for (Face faces: face){
            String t = new String(faces.getBase64());
            System.out.println(t);
        }
        return face;
    }

    @Test
    public void testSelectAll() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        FaceService dao = (FaceService) ac.getBean("faceServiceImpl");

        dao.selectAllUsers();
    }


    @Test
    public void testSelectAlls() {
        ApplicationContext ac = new ClassPathXmlApplicationContext(
                "applicationContext.xml");
        FaceService dao = (FaceService) ac.getBean("faceServiceImpl");
        List<Face> users = dao.selectAllUsers();
    }


}
