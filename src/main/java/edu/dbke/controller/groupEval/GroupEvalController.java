package edu.dbke.controller.groupEval;


import edu.dbke.model.basic.TeachingClass;
import edu.dbke.model.groupEval.GroupEval;
import edu.dbke.service.babic.CoursegroupService;
import edu.dbke.service.babic.TeachingClassService;
import edu.dbke.service.groupEval.GroupEvalQuestionService;
import edu.dbke.service.groupEval.GroupEvalService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by hp on 2016/12/29.
 */
@Controller
@RequestMapping("/groupEval")
public class GroupEvalController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    GroupEval groupEval = new GroupEval();
    @Resource
    private GroupEvalService groupEvalService;
    @Resource
    private GroupEvalQuestionService groupEvalQuestionService;
    @Resource
    private TeachingClassService teachingClassService;
    @Resource
    private CoursegroupService coursegroupService;

    //教师获取该教学班级的所有评测
    @RequestMapping("/manage")
    public ModelAndView evalManage() {
        ModelAndView mav = new ModelAndView();
        List<GroupEval> groupEval = groupEvalService.selectAllT();
        mav.addObject("groupEval", groupEval);
        mav.setViewName("groupEval/teacher/groupEvalManage");
        return mav;


    }
//    //学生获取该教学班级的所有评测
//    @RequestMapping("/list")
//    public ModelAndView evalList() {
//
//        List<GroupEval> groupEval = groupEvalService.selectAllT();
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("groupEval", groupEval);
//        mav.setViewName("groupEval/student/groupEvalList");
//        return mav;
//    }
//
//    @RequestMapping("/course")
//    public ModelAndView coursegroupList() throws Exception{
//
//        List<Coursegroup> coursegroupList= coursegroupService.getCoursegroupList();
//        //相当于request的setAttribute，在jsp页面中通过itemList来获取
//        mv.addObject("coursegroupList",coursegroupList);
//        //指定视图
//
//        return evalManage();
//    }
    @RequestMapping("/teachingClass")
    public ModelAndView teachingClassList() {
        ModelAndView mv = new ModelAndView();
        List<TeachingClass> teachingClassList= teachingClassService.selectByTeacher();
        mv.addObject("teachingClassList",teachingClassList);
        return evalManage();
    }
    //添加评测
    @RequestMapping("/create")
    public ModelAndView insertGroupEval(HttpServletRequest request) {
        groupEval.setId(groupEval.getId());
        groupEval.setStatus(GroupEval.UNDELETED);
        groupEval.setAutoPublish(false);
        groupEval.setStartTime(new Date());
        groupEval.setEndTime(new Date());
        groupEval.setGroupTime(new Date());
        groupEval.setUploadTime(new Date());
        groupEval.setOwnerId(groupEval.getOwnerId());
        groupEval.setEvalTitle(request.getParameter("EvalTitle"));
        groupEval.setEvalDetail(request.getParameter("EvalDetail"));
        groupEval.setTeachingClassId(groupEval.getTeachingClassId());
        groupEval.setGroupEvalQuestionId(groupEval.getGroupEvalQuestionId());
        groupEvalService.insertGroupEval(groupEval);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("groupEval/teacher/addGroupEval");
        return mav;
    }
//
//    //删除单个评测
//    @RequestMapping("/delete")
//    public ModelAndView deleteGroupEval(HttpServletRequest request) {
//        groupEvalService.deleteGroupEval(groupEval);
//        return evalManage();
//    }
//
//    //批量删除评测
//    @RequestMapping("/deletes")
//    public ModelAndView deleteGroupEvalS(HttpServletRequest request) {
//        GroupEval groupEval = new GroupEval();
//        groupEvalService.deleteGroupEvalS(groupEval);
//        return evalManage();
//    }
//
//    // 发布开关
//    public String publish() {
//        Integer id = groupEval.getId();
//        GroupEval groupEval = groupEvalService.selectByPrimaryKey(id);
//        groupEval.setAutoPublish(!groupEval.isAutoPublish());
//        String result = "true";
//        return null;
//    }
//
//
//    //判断评测是否开始
//    public ModelAndView timeJudge() {
//        List<Integer> Ids = null;
//        List times = groupEvalService.selectSTimeByIdsBatch(Ids);
//        Date startTime;
//
//        if (times != null && times.size() != 0) {
//            startTime = (Date) times.get(0);
//            if (startTime.getTime() < new Date().getTime()) {
//                String result = "true";
//            } else {
//                String result = "亲，评测还未开始";
//            }
//        }
//
//        return null;
//    }
//
//    // 评测初始默认时间
//    public String forwardToCreate() {
//
//        Calendar time = Calendar.getInstance();
//        time.add(Calendar.DATE, 3);
//        groupEval.setGroupTime(time.getTime());//默认分组结束时间
//
//        time.add(Calendar.DATE, 2);//默认附件上传结束时间
//        groupEval.setUploadTime(time.getTime());
//
//        time.add(Calendar.DATE, 2);
//        groupEval.setEndTime(time.getTime()); //默认评测结束时间
//
//        return null;
//    }
//
//    //设置评测参数
//    public String setArgs() {
//        GroupEval target = groupEvalService.selectByPrimaryKey(groupEval.getId());
//        target.setBsWitch(true);
//        target.setAutoPublish(groupEval.isAutoPublish());
//        target.setAnonymousComment(false);
//        target.setPublishResult(groupEval.isPublishResult());
//        if (groupEval.getStartTime().after(groupEval.getGroupTime())) {
//            String result = "评测开始时间不可晚于分组截止时间！";
//            return result;
//        }
//        if (groupEval.getUploadTime().before(groupEval.getGroupTime())) {
//            String result = "作品上传截止时间不可早于分组截止时间！";
//            return result;
//        }
//        if (groupEval.getUploadTime().after(groupEval.getEndTime())) {
//            String result = "作品上传截止时间不可晚于评测结束时间！";
//            return result;
//        }
//        target.setStartTime(groupEval.getStartTime());
//        target.setEndTime(groupEval.getEndTime());
//        target.setUploadTime(groupEval.getUploadTime());
//        target.setGroupTime(groupEval.getGroupTime());
//        groupEvalService.update(groupEval);
//
//        return null;
//    }


}
