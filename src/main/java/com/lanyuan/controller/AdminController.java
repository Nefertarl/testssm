package com.lanyuan.controller;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Admin;
import com.lanyuan.pojo.Role;
import com.lanyuan.service.AdminService;
import com.lanyuan.service.RoleService;
import com.lanyuan.util.CodeUtil;
import com.lanyuan.util.UploadAndLoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService as;

    @Autowired
    RoleService rs;

    @RequestMapping("/getCode")
    public void getCode(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CodeUtil.processRequest(req,resp); //底层会返回图片,同时验证码存session
        ServletContext application = session.getServletContext();
        String code2 =(String) application.getAttribute("randomCode2");
        System.err.println("application存的验证码是["+code2+"]");
    }

    @RequestMapping("/logins")
    public String logins(String account, String password, String code, HttpSession session,Map m){
        ServletContext application = session.getServletContext();
        String ran2 =(String) application.getAttribute("randomCode2");
        Admin a = new Admin(account,password);
        if(ran2.equalsIgnoreCase(code)){
            Admin admin = as.login(a);
            if(admin!=null){
                session.setAttribute("admin",admin);
                return "/home";
            }else m.put("error","账号密码输入错误");
        }else {
            m.put("error","验证码输入错误");
        }
        return "/login";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/toLogin";
    }

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "2")Integer pageSize, Map m, HttpSession session,Admin a){
        if(a.getSex()!=null){
            a.setSex(a.getSex().equals("男")?"1":"0");
        }
        if(a.getAccount()!=null || a.getName()!=null || a.getSex()!=null){
            session.setAttribute("search",a);
        }else{
            a = (Admin) session.getAttribute("search");
        }
        PageInfo<Admin> p = as.show(pageNum,pageSize,a);
        m.put("p",p);
        return "/admin/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "/admin/add";
    }

    //注册验证-是否存在该账号
    @RequestMapping(value = "/checkAccount",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkAccount(String account){
        Admin u = as.findByAcunt(account);
        if (u==null){
            return "账号可用";
        }else {
            return "账号不可用";
        }
    }

    //注册操作
    @RequestMapping("/doAdd")
    public String doAdd(Admin u, MultipartFile myHead, HttpServletRequest req){
        u.setCreatetime(new Date());
        if (myHead.getOriginalFilename().length()>0){
            u.setHeadPic(UploadAndLoadUtil.upload(req,myHead));
        }
        as.addUser(u);
        return "redirect:/admin/show";

    }

    //删除用户功能
    @RequestMapping("/doDelAdmin")
    public String doDelAdmin(Integer id,String myHead,HttpServletRequest req){
        System.out.println("===========>"+myHead);
        //删除图片
        String src = req.getServletContext().getRealPath("/upload")+ File.separator+myHead;
        File f = new File(src);
        f.delete();

        //先删除原来的关系表
        as.removeUes(id);

        int n = as.doDelUser(id);
        return "redirect:/admin/show";
    }
    //批量删除
    @RequestMapping("/doBathDelAdmin")
    public String doBathDelAdmin(Integer[] ids,HttpServletRequest req){
        for (Integer id : ids) {
            Admin u = as.findById(id);
            String src = req.getServletContext().getRealPath("/upload")+File.separator+u.getHeadPic();
            new File(src).delete();
        }

        for (Integer id: ids){
            //先删除原来的关系表
            as.removeUes(id);
        }

        as.doBathDelUser(ids);
        return "redirect:/admin/show";
    }

    @RequestMapping("/toUpdateAdmin")
    public String toUpdateAdmin(Integer id,Map map){
        Admin a = as.findById(id);
        map.put("a",a);
        return "/admin/edit";
    }

    @RequestMapping("/doUpdateAdmin")
    public String doUpdateAdmin(Admin u,MultipartFile myHead,HttpServletRequest req){
        if (myHead.getOriginalFilename().length()>0){
            //删除之前的图片
            Admin uid = as.findById(u.getId());
            String path = req.getServletContext().getRealPath("/upload")+File.separator+uid.getHeadPic();
            new File(path).delete();
            //上传修改后的图片
            u.setHeadPic(UploadAndLoadUtil.upload(req,myHead));
        }
        int n = as.doUpdateAdmin(u);
        return "redirect:/admin/show";
    }

    @RequestMapping("/toResRole")
    public String toResRole(Integer id,Map map){
        Admin r = as.findById(id);
        //查询所有角色
        List<Role> rt = rs.selectRoleAll();
        map.put("as",r);
        map.put("rs",rt);
        return "/admin/resources";
    }

    @RequestMapping("/doAddRes")
    public String doAddRes(Integer uid,Integer[] rid){

        //先删除原来的关系表
        as.removeUes(uid);

        //再添加现有的
        as.addUes(uid,rid);
        return "redirect:/admin/show";
    }

}
