package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_syllabus")
public class Syllabus {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 课程中文名称
     */
    @Column(name = "CourseName")
    private String coursename;

    /**
     * 课程英文名称
     */
    @Column(name = "CourseEnName")
    private String courseenname;

    /**
     * 课程负责学院ID
     */
    @Column(name = "InChargeOfDeptId")
    private Integer inchargeofdeptid;

    /**
     * 课程适合专业
     */
    @Column(name = "CourseFitProfession")
    private String coursefitprofession;

    /**
     * 开课单位
     */
    @Column(name = "CourseOpenTRSectionId")
    private Integer courseopentrsectionid;

    /**
     * 先修课程
     */
    @Column(name = "PreCourse")
    private String precourse;

    /**
     * 模块
     */
    @Column(name = "MoudleId")
    private Integer moudleid;

    /**
     * 类别
     */
    @Column(name = "CategroyId")
    private Integer categroyid;

    /**
     * 学分
     */
    @Column(name = "Credits")
    private Float credits;

    /**
     * 课程性质
     */
    @Column(name = "CourseNatureld")
    private Integer coursenatureld;

    /**
     * 考试方式
     */
    @Column(name = "ExamMode")
    private String exammode;

    /**
     * 平时成绩比例
     */
    @Column(name = "InspectionProportion")
    private Integer inspectionproportion;

    /**
     * 总学时 
     */
    @Column(name = "TotalClassHours")
    private Integer totalclasshours;

    /**
     * 讲授学时
     */
    @Column(name = "LectureHours")
    private Integer lecturehours;

    /**
     * 上机学时
     */
    @Column(name = "ComputerHours")
    private Integer computerhours;

    /**
     * 实验学时
     */
    @Column(name = "ExperimentHours")
    private Integer experimenthours;

    /**
     * 实习学时
     */
    @Column(name = "InternshipHours")
    private Integer internshiphours;

    /**
     * 实习周
     */
    @Column(name = "InternshipWeek")
    private Integer internshipweek;

    /**
     * 版本
     */
    @Column(name = "Version")
    private String version;

    /**
     * 附件路径
     */
    @Column(name = "FilePath")
    private String filepath;

    /**
     * 备注
     */
    @Column(name = "Memo")
    private String memo;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    @Column(name = "LastEditUser")
    private String lastedituser;

    /**
     * 状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过
     */
    @Column(name = "Status")
    private Integer status;

    /**
     * 大纲编号
     */
    @Column(name = "SyllabusCode")
    private String syllabuscode;

    /**
     * 是否申请更改：0-不更改，1-更改
     */
    @Column(name = "ApplyStatus")
    private Integer applystatus;

    /**
     * 审批备注
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
     * 获取课程中文名称
     *
     * @return CourseName - 课程中文名称
     */
    public String getCoursename() {
        return coursename;
    }

    /**
     * 设置课程中文名称
     *
     * @param coursename 课程中文名称
     */
    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    /**
     * 获取课程英文名称
     *
     * @return CourseEnName - 课程英文名称
     */
    public String getCourseenname() {
        return courseenname;
    }

    /**
     * 设置课程英文名称
     *
     * @param courseenname 课程英文名称
     */
    public void setCourseenname(String courseenname) {
        this.courseenname = courseenname;
    }

    /**
     * 获取课程负责学院ID
     *
     * @return InChargeOfDeptId - 课程负责学院ID
     */
    public Integer getInchargeofdeptid() {
        return inchargeofdeptid;
    }

    /**
     * 设置课程负责学院ID
     *
     * @param inchargeofdeptid 课程负责学院ID
     */
    public void setInchargeofdeptid(Integer inchargeofdeptid) {
        this.inchargeofdeptid = inchargeofdeptid;
    }

    /**
     * 获取课程适合专业
     *
     * @return CourseFitProfession - 课程适合专业
     */
    public String getCoursefitprofession() {
        return coursefitprofession;
    }

    /**
     * 设置课程适合专业
     *
     * @param coursefitprofession 课程适合专业
     */
    public void setCoursefitprofession(String coursefitprofession) {
        this.coursefitprofession = coursefitprofession;
    }

    /**
     * 获取开课单位
     *
     * @return CourseOpenTRSectionId - 开课单位
     */
    public Integer getCourseopentrsectionid() {
        return courseopentrsectionid;
    }

    /**
     * 设置开课单位
     *
     * @param courseopentrsectionid 开课单位
     */
    public void setCourseopentrsectionid(Integer courseopentrsectionid) {
        this.courseopentrsectionid = courseopentrsectionid;
    }

    /**
     * 获取先修课程
     *
     * @return PreCourse - 先修课程
     */
    public String getPrecourse() {
        return precourse;
    }

    /**
     * 设置先修课程
     *
     * @param precourse 先修课程
     */
    public void setPrecourse(String precourse) {
        this.precourse = precourse;
    }

    /**
     * 获取模块
     *
     * @return MoudleId - 模块
     */
    public Integer getMoudleid() {
        return moudleid;
    }

    /**
     * 设置模块
     *
     * @param moudleid 模块
     */
    public void setMoudleid(Integer moudleid) {
        this.moudleid = moudleid;
    }

    /**
     * 获取类别
     *
     * @return CategroyId - 类别
     */
    public Integer getCategroyid() {
        return categroyid;
    }

    /**
     * 设置类别
     *
     * @param categroyid 类别
     */
    public void setCategroyid(Integer categroyid) {
        this.categroyid = categroyid;
    }

    /**
     * 获取学分
     *
     * @return Credits - 学分
     */
    public Float getCredits() {
        return credits;
    }

    /**
     * 设置学分
     *
     * @param credits 学分
     */
    public void setCredits(Float credits) {
        this.credits = credits;
    }

    /**
     * 获取课程性质
     *
     * @return CourseNatureld - 课程性质
     */
    public Integer getCoursenatureld() {
        return coursenatureld;
    }

    /**
     * 设置课程性质
     *
     * @param coursenatureld 课程性质
     */
    public void setCoursenatureld(Integer coursenatureld) {
        this.coursenatureld = coursenatureld;
    }

    /**
     * 获取考试方式
     *
     * @return ExamMode - 考试方式
     */
    public String getExammode() {
        return exammode;
    }

    /**
     * 设置考试方式
     *
     * @param exammode 考试方式
     */
    public void setExammode(String exammode) {
        this.exammode = exammode;
    }

    /**
     * 获取平时成绩比例
     *
     * @return InspectionProportion - 平时成绩比例
     */
    public Integer getInspectionproportion() {
        return inspectionproportion;
    }

    /**
     * 设置平时成绩比例
     *
     * @param inspectionproportion 平时成绩比例
     */
    public void setInspectionproportion(Integer inspectionproportion) {
        this.inspectionproportion = inspectionproportion;
    }

    /**
     * 获取总学时 
     *
     * @return TotalClassHours - 总学时 
     */
    public Integer getTotalclasshours() {
        return totalclasshours;
    }

    /**
     * 设置总学时 
     *
     * @param totalclasshours 总学时 
     */
    public void setTotalclasshours(Integer totalclasshours) {
        this.totalclasshours = totalclasshours;
    }

    /**
     * 获取讲授学时
     *
     * @return LectureHours - 讲授学时
     */
    public Integer getLecturehours() {
        return lecturehours;
    }

    /**
     * 设置讲授学时
     *
     * @param lecturehours 讲授学时
     */
    public void setLecturehours(Integer lecturehours) {
        this.lecturehours = lecturehours;
    }

    /**
     * 获取上机学时
     *
     * @return ComputerHours - 上机学时
     */
    public Integer getComputerhours() {
        return computerhours;
    }

    /**
     * 设置上机学时
     *
     * @param computerhours 上机学时
     */
    public void setComputerhours(Integer computerhours) {
        this.computerhours = computerhours;
    }

    /**
     * 获取实验学时
     *
     * @return ExperimentHours - 实验学时
     */
    public Integer getExperimenthours() {
        return experimenthours;
    }

    /**
     * 设置实验学时
     *
     * @param experimenthours 实验学时
     */
    public void setExperimenthours(Integer experimenthours) {
        this.experimenthours = experimenthours;
    }

    /**
     * 获取实习学时
     *
     * @return InternshipHours - 实习学时
     */
    public Integer getInternshiphours() {
        return internshiphours;
    }

    /**
     * 设置实习学时
     *
     * @param internshiphours 实习学时
     */
    public void setInternshiphours(Integer internshiphours) {
        this.internshiphours = internshiphours;
    }

    /**
     * 获取实习周
     *
     * @return InternshipWeek - 实习周
     */
    public Integer getInternshipweek() {
        return internshipweek;
    }

    /**
     * 设置实习周
     *
     * @param internshipweek 实习周
     */
    public void setInternshipweek(Integer internshipweek) {
        this.internshipweek = internshipweek;
    }

    /**
     * 获取版本
     *
     * @return Version - 版本
     */
    public String getVersion() {
        return version;
    }

    /**
     * 设置版本
     *
     * @param version 版本
     */
    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * 获取附件路径
     *
     * @return FilePath - 附件路径
     */
    public String getFilepath() {
        return filepath;
    }

    /**
     * 设置附件路径
     *
     * @param filepath 附件路径
     */
    public void setFilepath(String filepath) {
        this.filepath = filepath;
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
     * 获取状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过
     *
     * @return Status - 状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过
     *
     * @param status 状态：0-编辑中，1-待审核，2-审核通过，3-审核不通过
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取大纲编号
     *
     * @return SyllabusCode - 大纲编号
     */
    public String getSyllabuscode() {
        return syllabuscode;
    }

    /**
     * 设置大纲编号
     *
     * @param syllabuscode 大纲编号
     */
    public void setSyllabuscode(String syllabuscode) {
        this.syllabuscode = syllabuscode;
    }

    /**
     * 获取是否申请更改：0-不更改，1-更改
     *
     * @return ApplyStatus - 是否申请更改：0-不更改，1-更改
     */
    public Integer getApplystatus() {
        return applystatus;
    }

    /**
     * 设置是否申请更改：0-不更改，1-更改
     *
     * @param applystatus 是否申请更改：0-不更改，1-更改
     */
    public void setApplystatus(Integer applystatus) {
        this.applystatus = applystatus;
    }

    /**
     * 获取审批备注
     *
     * @return ApproveMemo - 审批备注
     */
    public String getApprovememo() {
        return approvememo;
    }

    /**
     * 设置审批备注
     *
     * @param approvememo 审批备注
     */
    public void setApprovememo(String approvememo) {
        this.approvememo = approvememo;
    }
}