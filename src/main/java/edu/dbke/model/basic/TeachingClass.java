package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_jx_class")
public class TeachingClass {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 教学班名称
     */
    @Column(name = "Name")
    private String name;

    /**
     * 课程Id
     */
    @Column(name = "SemesterPlanDetailId")
    private Integer semesterplandetailid;

    /**
     * 所属学院
     */
    @Column(name = "DeptId")
    private Integer deptid;

    /**
     * 任课主讲老师ID
     */
    @Column(name = "TeacherId")
    private Integer teacherid;

    @Column(name = "BeginDate")
    private Date begindate;

    @Column(name = "EndDate")
    private Date enddate;

    @Column(name = "Status")
    private Integer status;

    @Column(name = "ClassIds")
    private String classids;

    /**
     * 备注
     */
    @Column(name = "Memo")
    private String memo;

    /**
     * 开始周
     */
    @Column(name = "WeekBegin")
    private Integer weekbegin;

    /**
     * 结束周 (教学班上课)
     */
    @Column(name = "WeekEnd")
    private Integer weekend;

    /**
     * 是否需要多媒体
     */
    @Column(name = "Media")
    private Integer media;

    @Column(name = "TotalHours")
    private Integer totalhours;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "LastEditUser")
    private String lastedituser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    /**
     * 老师2
     */
    @Column(name = "TeacherTwoId")
    private Integer teachertwoid;

    /**
     * 助教
     */
    @Column(name = "TeachingAssistant")
    private String teachingassistant;

    /**
     * 实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过
     */
    @Column(name = "ApproveStatus")
    private Integer approvestatus;

    /**
     * 审核备注
     */
    @Column(name = "ApproveMemo")
    private String approvememo;

    /**
     * @return Id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取教学班名称
     *
     * @return Name - 教学班名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置教学班名称
     *
     * @param name 教学班名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取课程Id
     *
     * @return SemesterPlanDetailId - 课程Id
     */
    public Integer getSemesterplandetailid() {
        return semesterplandetailid;
    }

    /**
     * 设置课程Id
     *
     * @param semesterplandetailid 课程Id
     */
    public void setSemesterplandetailid(Integer semesterplandetailid) {
        this.semesterplandetailid = semesterplandetailid;
    }

    /**
     * 获取所属学院
     *
     * @return DeptId - 所属学院
     */
    public Integer getDeptid() {
        return deptid;
    }

    /**
     * 设置所属学院
     *
     * @param deptid 所属学院
     */
    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    /**
     * 获取任课主讲老师ID
     *
     * @return TeacherId - 任课主讲老师ID
     */
    public Integer getTeacherid() {
        return teacherid;
    }

    /**
     * 设置任课主讲老师ID
     *
     * @param teacherid 任课主讲老师ID
     */
    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    /**
     * @return BeginDate
     */
    public Date getBegindate() {
        return begindate;
    }

    /**
     * @param begindate
     */
    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    /**
     * @return EndDate
     */
    public Date getEnddate() {
        return enddate;
    }

    /**
     * @param enddate
     */
    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    /**
     * @return Status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return ClassIds
     */
    public String getClassids() {
        return classids;
    }

    /**
     * @param classids
     */
    public void setClassids(String classids) {
        this.classids = classids;
    }

    /**
     * 获取备注
     *
     * @return Memo - 备注
     */
    public String getMemo() {
        return memo;
    }

    /**
     * 设置备注
     *
     * @param memo 备注
     */
    public void setMemo(String memo) {
        this.memo = memo;
    }

    /**
     * 获取开始周
     *
     * @return WeekBegin - 开始周
     */
    public Integer getWeekbegin() {
        return weekbegin;
    }

    /**
     * 设置开始周
     *
     * @param weekbegin 开始周
     */
    public void setWeekbegin(Integer weekbegin) {
        this.weekbegin = weekbegin;
    }

    /**
     * 获取结束周 (教学班上课)
     *
     * @return WeekEnd - 结束周 (教学班上课)
     */
    public Integer getWeekend() {
        return weekend;
    }

    /**
     * 设置结束周 (教学班上课)
     *
     * @param weekend 结束周 (教学班上课)
     */
    public void setWeekend(Integer weekend) {
        this.weekend = weekend;
    }

    /**
     * 获取是否需要多媒体
     *
     * @return Media - 是否需要多媒体
     */
    public Integer getMedia() {
        return media;
    }

    /**
     * 设置是否需要多媒体
     *
     * @param media 是否需要多媒体
     */
    public void setMedia(Integer media) {
        this.media = media;
    }

    /**
     * @return TotalHours
     */
    public Integer getTotalhours() {
        return totalhours;
    }

    /**
     * @param totalhours
     */
    public void setTotalhours(Integer totalhours) {
        this.totalhours = totalhours;
    }

    /**
     * @return InUser
     */
    public String getInuser() {
        return inuser;
    }

    /**
     * @param inuser
     */
    public void setInuser(String inuser) {
        this.inuser = inuser;
    }

    /**
     * @return InDate
     */
    public Date getIndate() {
        return indate;
    }

    /**
     * @param indate
     */
    public void setIndate(Date indate) {
        this.indate = indate;
    }

    /**
     * @return LastEditUser
     */
    public String getLastedituser() {
        return lastedituser;
    }

    /**
     * @param lastedituser
     */
    public void setLastedituser(String lastedituser) {
        this.lastedituser = lastedituser;
    }

    /**
     * @return LastEditDate
     */
    public Date getLasteditdate() {
        return lasteditdate;
    }

    /**
     * @param lasteditdate
     */
    public void setLasteditdate(Date lasteditdate) {
        this.lasteditdate = lasteditdate;
    }

    /**
     * 获取老师2
     *
     * @return TeacherTwoId - 老师2
     */
    public Integer getTeachertwoid() {
        return teachertwoid;
    }

    /**
     * 设置老师2
     *
     * @param teachertwoid 老师2
     */
    public void setTeachertwoid(Integer teachertwoid) {
        this.teachertwoid = teachertwoid;
    }

    /**
     * 获取助教
     *
     * @return TeachingAssistant - 助教
     */
    public String getTeachingassistant() {
        return teachingassistant;
    }

    /**
     * 设置助教
     *
     * @param teachingassistant 助教
     */
    public void setTeachingassistant(String teachingassistant) {
        this.teachingassistant = teachingassistant;
    }

    /**
     * 获取实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过
     *
     * @return ApproveStatus - 实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过
     */
    public Integer getApprovestatus() {
        return approvestatus;
    }

    /**
     * 设置实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过
     *
     * @param approvestatus 实验教学任务审核状态：0-编辑中，1-待审核，2-审核通过，3-审核未通过
     */
    public void setApprovestatus(Integer approvestatus) {
        this.approvestatus = approvestatus;
    }

    /**
     * 获取审核备注
     *
     * @return ApproveMemo - 审核备注
     */
    public String getApprovememo() {
        return approvememo;
    }

    /**
     * 设置审核备注
     *
     * @param approvememo 审核备注
     */
    public void setApprovememo(String approvememo) {
        this.approvememo = approvememo;
    }
}