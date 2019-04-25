package com.beibo.service.impl;


import com.beibo.mapper.IotAdminMapper;
import com.beibo.pojo.IotAdmin;
import com.beibo.service.IotAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iotAdminService")
public class IotAdminServiceImpl implements IotAdminService {

    @Autowired
    private IotAdminMapper iotAdminMapper;

    @Override
    public List<IotAdmin> queryAll() {
        return iotAdminMapper.queryAll();
    }

    @Override
    public boolean add(IotAdmin iotAdmin) {
        int row = iotAdminMapper.add(iotAdmin);
        return row == 1 ? true:false;
    }

    @Override
    public List<IotAdmin> queryByName(String adminName) {
        return iotAdminMapper.queryByName(adminName);
    }

    @Override
    public IotAdmin queryById(Integer adminId) {
        if (adminId == null || adminId == 0){
            return null;
        }
        return iotAdminMapper.queryById(adminId);
    }

    @Override
    public boolean update(IotAdmin iotAdmin) {
        if(iotAdmin.getAdminId() == null || iotAdmin.getAdminId() == 0){
            return false;
        }
        return iotAdminMapper.update(iotAdmin) == 1 ? true:false;
    }

    @Override
    public boolean delete(Integer adminId) {
        int row = iotAdminMapper.delete(adminId);
        return row == 1 ? true: false;
    }

}
