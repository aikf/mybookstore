package com.xym.controller.backend;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xym.pojo.Book;
import com.xym.pojo.Category;
import com.xym.service.BusinessService;
import com.xym.vo.PageInfo;
import com.xym.vo.QueryInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName BookController
 * @Description TODO
 * @Author ak
 * @Date 2018/12/3 下午9:43
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class BookController {

    @Autowired
    BusinessService businessService;

    @RequestMapping("/addBookUI")
    public String addBookUI(Model model){
        List<Category> categories = businessService.getAllCategory();
        model.addAttribute("categories", categories);
        return "backend/addBookUI";
    }

    @RequestMapping("/addBook")
    @ResponseBody
    public String addBook(Book book, @RequestParam("file")MultipartFile file, HttpServletRequest request) throws IOException {
        InputStream in = file.getInputStream();
        String path = request.getServletContext().getRealPath("/");
        String uploadPath = path+"files/";
        String filename = UUID.randomUUID().toString()+"-"+file.getOriginalFilename();
        FileOutputStream out = new FileOutputStream(uploadPath + filename);
        byte[] b = new byte[1024];
        int len;
        while ((len = in.read(b)) != -1) {
            out.write(b,0,len);
        }
        out.close();
        in.close();
        book.setId(UUID.randomUUID().toString());
        book.setImage(filename);
        System.out.println(book);
        businessService.addBook(book);
        return "1";
    }

    @RequestMapping("/books")
    public String books(){
        return "backend/books";
    }

    @RequestMapping(value = "/aBooks",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String aBooks(QueryInfo info) throws JsonProcessingException {
        // 拼装符合前端easyUI的json字符串
        PageInfo pageInfo = businessService.pageQuery(info);
        List<Book> list = pageInfo.getList();
        ObjectMapper mapper = new ObjectMapper();
        String listStr = mapper.writeValueAsString(list);
        int totalrecord = pageInfo.getTotalrecord();
        StringBuilder jsonStr = new StringBuilder("{\"total\":" + totalrecord + ",\"rows\":");
        jsonStr.append(listStr);
        jsonStr.append("}");
        // response.setContentType("application/json;charset=utf-8")无效
        // 参考http://www.cnblogs.com/kaiblog/p/7565231.html
        return jsonStr.toString();
    }



}