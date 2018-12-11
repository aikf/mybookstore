package com.xym.controller.portal;

import com.xym.pojo.*;
import com.xym.service.BusinessService;
import com.xym.vo.PageInfo;
import com.xym.vo.QueryInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;

/**
 * @ClassName BookStoreController
 * @Description TODO 前台操作控制器
 * @Author ak
 * @Date 2018/12/4 下午12:56
 * @Version 1.0
 **/
@Controller
@RequestMapping
public class BookStoreController {

    @Autowired
    private BusinessService businessService;

    /*
    查看首页所有分类下图书
     */
    @RequestMapping("/")
    public String index(Model model){
        List<Category> categories = businessService.getAllCategory();
        model.addAttribute("categories", categories);
        return "portal/index";
    }

    /*
    查看特定分类下图书
     */
    @RequestMapping("/list")
    public String getList(QueryInfo info, Model model){

        PageInfo pageInfo = businessService.pageQuery(info);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("categoryId", info.getCategoryId());
        return "portal/list";
    }

    /*
    请求添加购物车
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(@RequestParam("id") String id, HttpSession session){
        Book book = businessService.findBookById(id);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        cart.add(book);
        return "1";
    }

    /*
    请求查看购物车
     */
    @RequestMapping("/listCart")
    @ResponseBody
    public List<CartItem> listCart(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            return null;
        }
        Map<String, CartItem> map = cart.getMap();
        List<CartItem> ci = new ArrayList<>();
        for (Map.Entry<String,CartItem> item : map.entrySet()) {
            CartItem i = item.getValue();
            ci.add(i);
        }
        return ci;
    }

    /*
    查看图书详情页
     */
    @RequestMapping("/showBook")
    public String showBook(@RequestParam("id") String id, Model model, HttpServletRequest request, HttpServletResponse response) {
        Book book = businessService.findBookById(id);
        String cookie = buildCookie(request,id);
        Cookie look = new Cookie("look", cookie);
        look.setMaxAge(24*60*60);
        look.setPath("/");
        response.addCookie(look);
        model.addAttribute("book", book);
        return "portal/showBook";
    }

    /*
    构建足迹 cookie 字符串
     */
    private String buildCookie(HttpServletRequest request, String id) {
        String look = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null&&cookies.length>i; i++) {
            if (cookies[i].getName().equals("look")) {
                look = cookies[i].getValue();
            }
        }
        if (look == null) {
            return id;
        }
        LinkedList<String> ids = new LinkedList<>(Arrays.asList(look.split(":")));
        if (ids.contains(id)) {
            ids.remove(id);
            ids.addFirst(id);
        }else{
            if (ids.size() >= 12) {
                ids.removeLast();
                ids.addFirst(id);
            }else {
                ids.addFirst(id);
            }
        }
        StringBuffer sb = new StringBuffer();
        for (String b : ids) {
            sb.append(b + ":");
        }
        return sb.deleteCharAt(sb.length()-1).toString();
    }

    /*
    查看足迹页面
     */
    @RequestMapping("/look")
    public String look(@CookieValue(value = "look",required = false) String look,Model model){
        if (look != null) {
            String[] ids = look.split(":");
            List<Book> books = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                Book b = businessService.findBookById(ids[i]);
                books.add(b);
            }
            model.addAttribute("books", books);
        }
        return "portal/lookPage";
    }

    /*
    清除足迹
     */
    @RequestMapping("/removeCookie")
    @ResponseBody
    public String removeCookie(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies != null && cookies.length > i; i++) {
            if (cookies[i].getName().equals("look")) {
                cookies[i].setMaxAge(0);
                // Cookie的路径必须一致才能删除
                cookies[i].setPath("/");
                response.addCookie(cookies[i]);
            }
        }
        return "success";
    }

    /*
    查看购物车页面
     */
    @RequestMapping("/cartPage")
    public String cartPage(HttpSession session, Model model){
        Cart cart = (Cart) session.getAttribute("cart");

        model.addAttribute("cart",cart);
        return "/portal/cartPage";
    }

    /*
    登录表单页面
     */
    @RequestMapping("/loginUI")
    public String loginUI(HttpSession session,@RequestHeader("Referer") String ref){
        // 记录前一个页面地址
        session.setAttribute("before",ref);
        return "/portal/login";
    }

    /*
    验证用户名是否存在
     */
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(String username){
        String regx = "^[a-zA-Z0-9_-]{4,16}$";
        if (!username.matches(regx)) {
            return Msg.fail().add("va_msg", "用户名是6-16位英文和数字的组合");
        }
        User user = businessService.findUserByUsername(username);
        if (user != null) {
            return Msg.fail().add("va_msg", "用户已存在");
        }else {
            return Msg.success();
        }
    }

    /*
    注册表单页面
     */
    @RequestMapping("/registerUI")
    public String registerUI(){
        return "/portal/register";
    }

    /*
    请求注册表单
     */
    @ResponseBody
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Msg register(@Valid User user, BindingResult result){
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError e : errors) {
                map.put(e.getField(), e.getDefaultMessage());
            }
            return Msg.fail().add("e", map);
        }else {
            user.setId(UUID.randomUUID().toString());
            businessService.addUser(user);
            return Msg.success();
        }

    }

    /*
    请求登录验证
     */
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, HttpSession session, @RequestHeader("Referer") String ref) {
        User u = businessService.findUserByPassword(user.getUsername(), user.getPassword());
        if (u != null) {
            session.setAttribute("user", u);
           String before = (String) session.getAttribute("before");
           session.removeAttribute("before");
            // 返回到上一个页面
           return before;
        }else {
            return null;
        }
    }

    /*
    购买图书页面
     */
    @RequestMapping("/buyBook")
    public String buyBook(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/loginUI";
        }
        Cart cart = (Cart) session.getAttribute("cart");
        model.addAttribute("cart", cart);
        model.addAttribute("user", user);
        return "portal/payBook";
    }

    /*
    请求支付 生成订单
     */
    @ResponseBody
    @RequestMapping("/payBook")
    public String payBook(HttpSession session){
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        businessService.saveOrder(cart,user);
        session.removeAttribute("cart");
        return "success";
    }

    /*
    退出登录
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
}