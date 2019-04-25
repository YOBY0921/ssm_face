package com.beibo.mapper;

import com.beibo.pojo.Face;
import com.beibo.pojo.UserLogin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FaceMapper {

    public List<Face> selectAllUsers();

}
