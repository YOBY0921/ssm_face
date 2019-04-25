package com.beibo.controller;

import com.beibo.pojo.Face;
import com.beibo.service.FaceService;
import com.beibo.util.GetTon;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class FaceControll {

    private static String accessToken;

    @Resource
    private FaceService faceService;

    @RequestMapping("/faceLogin")
    public ModelAndView accountManageJsp() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("faceLogin");
        return mv;
    }


    @ResponseBody
    @RequestMapping("/facelogin.action")
    public String onListStudent(HttpServletRequest request, HttpServletResponse response, Model model) {

        String base = request.getParameter("base");
        System.out.println(base);
        try {

            List<Face> users = this.faceService.selectAllUsers();
            String base64 = "";
            PrintWriter writer = response.getWriter();
            response.reset();

            for (Face face : users) {
                base64 = new String(face.getBase64());
                boolean result = getResult(base, base64);
                if (result) {
                    request.getSession().setAttribute("face", face);

                    System.out.println(result);
                    //  writer.print()：可以将各种类型（包括Object）的数据通过默认编码转换成bytes字节形式，这些字节都通过write(int c)方法被输出
                    writer.print(result);
                    writer.close();
                    return null;
                } else {
                    System.out.println(result);
                    writer.print(result);
                    writer.close();
                }
            }

        } catch (Exception e) {
//            e.printStackTrace();
//            log.error(e.toString(),e);
            System.out.println(e);
            return "redirect:/page/404.jsp";
        }

        return null;
    }



    public boolean getResult(String imStr1, String imgStr2) {

        accessToken = GetTon.getToken();
        boolean flag = false;
        BufferedReader br = null;
        String result = "";

        String mathUrl = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
            String params = URLEncoder.encode("images", "UTF-8") + "=" + URLEncoder.encode(imStr1 + imgStr2, "UTF-8");
            String genrearlURL = mathUrl + "?access_token=" + accessToken;

            URL url = new URL(genrearlURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.setDoInput(true);
            connection.setDoOutput(true);

            DataOutputStream out = new DataOutputStream(connection.getOutputStream());
            out.writeBytes(params);
            out.flush();
            out.close();
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(result);

        // result ="{"error_msg":"Unsupported openapi method","error_code":3}"

        JSONObject fromObject = JSONObject.fromObject(result);

        JSONArray jsonArray = fromObject.getJSONArray("result");

        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject object = (JSONObject) jsonArray.get(i);
            double resultList = object.getDouble("score");
            if (resultList >= 90) {
                flag = true;

            }
        }
        return flag;
    }


    @Test
    public void test() {
        getResult(null, null);
        System.out.println();

    }
}
