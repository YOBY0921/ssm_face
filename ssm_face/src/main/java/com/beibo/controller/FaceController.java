package com.beibo.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.beibo.util.GetToken;
import com.beibo.util.GsonUtils;
import com.beibo.util.HttpUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
public class FaceController {

    /**
     *
     * @return人脸识别界面
     */
    @RequestMapping("/faceSearch")
    public ModelAndView accountManageJsp() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("faceSearch");
        return mv;
    }

    /**
     * 人脸识别
     * @param request
     * @return 可自行将String改为JSONObject
     * @throws Exception
     */
    @RequestMapping("face.ajax")
    @ResponseBody
    public String face(HttpServletRequest request) throws Exception {

        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";//请求的url,可以查看官方文档查看不同请求的url

        Map<String, Object> map = new HashMap<>();
        map.put("image", request.getParameter("base"));//获取前台的人脸识别后发送的base64
        map.put("group_id_list", "userDemo");//之前创建的人脸库，可以在百度云的管理控制台查看用户组，face1是之前命名好的
        map.put("image_type", "BASE64");//照片类型为base64
        String param = GsonUtils.toJson(map);

        // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
        String accessToken = GetToken.getAuth();

        String result = HttpUtil.post(url, accessToken, "application/json", param);
        System.out.println("识别结果为："+result);

        JSONObject jsonObject = (JSONObject) JSON.parse(result);
        JSONObject object = (JSONObject) jsonObject.get("result");
        JSONArray string = (JSONArray) object.get("user_list");
        JSONObject ob = (JSONObject) string.get(0);
        BigDecimal valueOf = (BigDecimal) ob.get("score");

        String results = null;

        if(valueOf.doubleValue() > 60) {
            results = "success";
            System.out.println("识别相似度大于60分");
        }else {
            results = "false";
            System.out.println("识别相似度小于60分");
        }
        return results;

    }
}

