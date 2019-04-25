package com.beibo.controller;

import com.beibo.pojo.IotAdmin;
import com.beibo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/main")
    public String main(Model model){
        System.out.println("main....");
        List<IotAdmin> list = studentService.queryAll();
        model.addAttribute("student",list);
        return "main";
    }



//    @RequestMapping("/query/adminName")
//    public String queryByName(@RequestParam("adminName")String adminName, Model model){
//        model.addAttribute("adminName",adminName); //保存查询条件
//        List<IotAdmin> list = studentService.queryByName(adminName);
//        model.addAttribute("admin",list);
//        return "main";
//    }
//
//
//    @RequestMapping("/addTo")
//    public String addTo(){
//        return "admin/add";
//    }
//
//    @RequestMapping("/add")
//    public String add(IotAdmin iotAdmin,Model model){
//        boolean suc = studentService.add(iotAdmin);
//        List<IotAdmin> list = studentService.queryAll();
//        model.addAttribute("admin",list);
//        return "main";
//    }
//
//    @RequestMapping("/updateTo/{adminId}")
//    public String updateTo(@PathVariable("adminId")Integer adminId , Model model){
//        //先查询信息
//        IotAdmin iotAdmin = studentService.queryById(adminId);
//        model.addAttribute("iotAdmin",iotAdmin);
//        return "admin/edit";
//    }
//
//    @RequestMapping("/update")
//    public String update(IotAdmin iotAdmin, Model model){
//        boolean sucFlag = studentService.update(iotAdmin);
//
//        List<IotAdmin> list = studentService.queryAll();
//        model.addAttribute("admin",list);
//
////        List<Category> categories = categoryService.queryAll();
////        model.addAttribute("categoryId",id); //保存查询条件
////        model.addAttribute("categories",categories);
////        model.addAttribute("entries",entries);
//
//        model.addAttribute("sucFlag",sucFlag);
//        return "main";
//    }
//
//    @RequestMapping("delete/{adminId}")
//    public String delete(@PathVariable("adminId")Integer adminId, Model model){
//        boolean sucFlag = studentService.delete(adminId);
//        model.addAttribute("sucFlag", sucFlag);
////        删除成功后再搜索显示所有信息
//        List<IotAdmin> list = studentService.queryAll();
//        model.addAttribute("admin",list);
//        return "main";
//    }


    //生成随机uuid
//    public static String getUUID(){
//        UUID uuid=UUID.randomUUID();
//        String str = uuid.toString();
//        String uuidStr=str.replace("-", "");
//        return uuidStr;
//    }

}
