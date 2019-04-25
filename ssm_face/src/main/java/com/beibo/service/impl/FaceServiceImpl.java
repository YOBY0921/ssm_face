package com.beibo.service.impl;

import com.beibo.mapper.FaceMapper;
import com.beibo.pojo.Face;
import com.beibo.service.FaceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FaceServiceImpl implements FaceService {

    @Resource
    private FaceMapper faceMapper;

    @Override
    public List<Face> selectAllUsers() {
        return faceMapper.selectAllUsers();
    }
}
