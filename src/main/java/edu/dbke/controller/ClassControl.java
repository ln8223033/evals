package edu.dbke.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.dbke.model.basic.Class;
import edu.dbke.service.babic.ClassService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by hp on 2017/1/18.
 */
@Controller
@RequestMapping("/class")
public class ClassControl {
    @Resource
    private ClassService classService;
    //班级查询
    @RequestMapping("/queryItems")
    public ModelAndView queryItems(
                                   @RequestParam(required=true,defaultValue="1") Integer page,
                                   @RequestParam(required=false,defaultValue="10") Integer pageSize) throws Exception{
        PageHelper.startPage(page, pageSize);
        ModelAndView mv = new ModelAndView();
        //调用Service查找数据库，查询商品列表，这里使用静态数据模拟
        List<Class> classList=classService.getClassList();
        PageInfo<Class> p=new PageInfo<Class>(classList);
        //相当于request的setAttribute，在jsp页面中通过itemList来获取
        mv.addObject("classList",classList);
        //指定视图
        mv.addObject("page", p);
        mv.setViewName("classList");
        return mv;
    }
    //插入档案类型
    @RequestMapping("/insert")
    public ModelAndView insert(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        Class c= new Class();
        c.setName(request.getParameter("className"));
        mv.addObject("c",c);
        mv.setViewName("insertClass");
        classService.insert(c);
        return mv;
    }
}
