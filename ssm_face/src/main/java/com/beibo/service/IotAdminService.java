package com.beibo.service;

import com.beibo.pojo.IotAdmin;

import java.util.List;

public interface IotAdminService {
    List<IotAdmin> queryAll();

    boolean add(IotAdmin iotAdmin);

    List<IotAdmin> queryByName(String adminName);

    IotAdmin queryById(Integer adminId);

    boolean update(IotAdmin iotAdmin);

    boolean delete(Integer adminId);
}
