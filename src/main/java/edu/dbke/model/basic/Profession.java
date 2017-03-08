package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_profession")
public class Profession {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 中文专业名称
     */
    @Column(name = "Name")
    private String name;

    /**
     * 英文专业名称
     */
    @Column(name = "EnName")
    private String enname;

    /**
     * 专业（方向）名称
     */
    @Column(name = "DirectionName")
    private String directionname;

    /**
     * 学院ID
     */
    @Column(name = "DeptId")
    private Integer deptid;

    /**
     * 校区ID
     */
    @Column(name = "SchoolCampusId")
    private Integer schoolcampusid;

    /**
     * 教育部专业代码
     */
    @Column(name = "Code")
    private String code;

    /**
     * 校内专业代码
     */
    @Column(name = "CampusCode")
    private String campuscode;

    /**
     * 修业年限
     */
    @Column(name = "Term")
    private Integer term;

    /**
     * 授予学位
     */
    @Column(name = "Degree")
    private String degree;

    /**
     * 专业优势与特色
     */
    @Column(name = "Brief")
    private String brief;

    /**
     * 专业类型Id，eg: 工科，理科
     */
    @Column(name = "TypeID")
    private Integer typeid;

    /**
     * 学校方式，eg:业余，函数
     */
    @Column(name = "LearningTypeID")
    private Integer learningtypeid;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    @Column(name = "LastEdituser")
    private String lastedituser;

    /**
     * 批准文号
     */
    @Column(name = "ApprovalNo")
    private String approvalno;

    /**
     * 批准时间
     */
    @Column(name = "ApprovalDate")
    private Date approvaldate;

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
     * 获取中文专业名称
     *
     * @return Name - 中文专业名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置中文专业名称
     *
     * @param name 中文专业名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取英文专业名称
     *
     * @return EnName - 英文专业名称
     */
    public String getEnname() {
        return enname;
    }

    /**
     * 设置英文专业名称
     *
     * @param enname 英文专业名称
     */
    public void setEnname(String enname) {
        this.enname = enname;
    }

    /**
     * 获取专业（方向）名称
     *
     * @return DirectionName - 专业（方向）名称
     */
    public String getDirectionname() {
        return directionname;
    }

    /**
     * 设置专业（方向）名称
     *
     * @param directionname 专业（方向）名称
     */
    public void setDirectionname(String directionname) {
        this.directionname = directionname;
    }

    /**
     * 获取学院ID
     *
     * @return DeptId - 学院ID
     */
    public Integer getDeptid() {
        return deptid;
    }

    /**
     * 设置学院ID
     *
     * @param deptid 学院ID
     */
    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    /**
     * 获取校区ID
     *
     * @return SchoolCampusId - 校区ID
     */
    public Integer getSchoolcampusid() {
        return schoolcampusid;
    }

    /**
     * 设置校区ID
     *
     * @param schoolcampusid 校区ID
     */
    public void setSchoolcampusid(Integer schoolcampusid) {
        this.schoolcampusid = schoolcampusid;
    }

    /**
     * 获取教育部专业代码
     *
     * @return Code - 教育部专业代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置教育部专业代码
     *
     * @param code 教育部专业代码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取校内专业代码
     *
     * @return CampusCode - 校内专业代码
     */
    public String getCampuscode() {
        return campuscode;
    }

    /**
     * 设置校内专业代码
     *
     * @param campuscode 校内专业代码
     */
    public void setCampuscode(String campuscode) {
        this.campuscode = campuscode;
    }

    /**
     * 获取修业年限
     *
     * @return Term - 修业年限
     */
    public Integer getTerm() {
        return term;
    }

    /**
     * 设置修业年限
     *
     * @param term 修业年限
     */
    public void setTerm(Integer term) {
        this.term = term;
    }

    /**
     * 获取授予学位
     *
     * @return Degree - 授予学位
     */
    public String getDegree() {
        return degree;
    }

    /**
     * 设置授予学位
     *
     * @param degree 授予学位
     */
    public void setDegree(String degree) {
        this.degree = degree;
    }

    /**
     * 获取专业优势与特色
     *
     * @return Brief - 专业优势与特色
     */
    public String getBrief() {
        return brief;
    }

    /**
     * 设置专业优势与特色
     *
     * @param brief 专业优势与特色
     */
    public void setBrief(String brief) {
        this.brief = brief;
    }

    /**
     * 获取专业类型Id，eg: 工科，理科
     *
     * @return TypeID - 专业类型Id，eg: 工科，理科
     */
    public Integer getTypeid() {
        return typeid;
    }

    /**
     * 设置专业类型Id，eg: 工科，理科
     *
     * @param typeid 专业类型Id，eg: 工科，理科
     */
    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    /**
     * 获取学校方式，eg:业余，函数
     *
     * @return LearningTypeID - 学校方式，eg:业余，函数
     */
    public Integer getLearningtypeid() {
        return learningtypeid;
    }

    /**
     * 设置学校方式，eg:业余，函数
     *
     * @param learningtypeid 学校方式，eg:业余，函数
     */
    public void setLearningtypeid(Integer learningtypeid) {
        this.learningtypeid = learningtypeid;
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
     * @return LastEdituser
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
     * 获取批准文号
     *
     * @return ApprovalNo - 批准文号
     */
    public String getApprovalno() {
        return approvalno;
    }

    /**
     * 设置批准文号
     *
     * @param approvalno 批准文号
     */
    public void setApprovalno(String approvalno) {
        this.approvalno = approvalno;
    }

    /**
     * 获取批准时间
     *
     * @return ApprovalDate - 批准时间
     */
    public Date getApprovaldate() {
        return approvaldate;
    }

    /**
     * 设置批准时间
     *
     * @param approvaldate 批准时间
     */
    public void setApprovaldate(Date approvaldate) {
        this.approvaldate = approvaldate;
    }
}