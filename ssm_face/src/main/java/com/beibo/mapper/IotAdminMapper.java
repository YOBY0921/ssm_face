package com.beibo.mapper;

import com.beibo.pojo.IotAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IotAdminMapper {
    List<IotAdmin> queryAll();

    int add(IotAdmin iotAdmin);

    List<IotAdmin> queryByName(@Param("adminName") String adminName);

    IotAdmin queryById(@Param("adminId") Integer adminId);

    int update(IotAdmin iotAdmin);

    int delete(@Param("adminId") Integer adminId);
}
