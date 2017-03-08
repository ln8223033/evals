package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_teacher")
public class Teacher {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "LoginAccount")
    private String loginaccount;

    @Column(name = "PassWord")
    private String password;

    @Column(name = "Name")
    private String name;

    @Column(name = "Sex")
    private String sex;

    @Column(name = "Birthday")
    private Date birthday;

    @Column(name = "HireDate")
    private Date hiredate;

    @Column(name = "DepartmentId")
    private Integer departmentid;

    @Column(name = "JobTitleId")
    private Integer jobtitleid;

    @Column(name = "TypeId")
    private Integer typeid;

    @Column(name = "EducationbgId")
    private Integer educationbgid;

    @Column(name = "PhoneNumber")
    private String phonenumber;

    @Column(name = "Introduction")
    private String introduction;

    @Column(name = "Email")
    private String email;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "LastEditUser")
    private String lastedituser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    @Column(name = "PhotoPath")
    private String photopath;


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
     * @return LoginAccount
     */
    public String getLoginaccount() {
        return loginaccount;
    }

    /**
     * @param loginaccount
     */
    public void setLoginaccount(String loginaccount) {
        this.loginaccount = loginaccount;
    }

    /**
     * @return PassWord
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return Name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return Sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return Birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return HireDate
     */
    public Date getHiredate() {
        return hiredate;
    }

    /**
     * @param hiredate
     */
    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    /**
     * @return DepartmentId
     */
    public Integer getDepartmentid() {
        return departmentid;
    }

    /**
     * @param departmentid
     */
    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    /**
     * @return JobTitleId
     */
    public Integer getJobtitleid() {
        return jobtitleid;
    }

    /**
     * @param jobtitleid
     */
    public void setJobtitleid(Integer jobtitleid) {
        this.jobtitleid = jobtitleid;
    }

    /**
     * @return TypeId
     */
    public Integer getTypeid() {
        return typeid;
    }

    /**
     * @param typeid
     */
    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    /**
     * @return EducationbgId
     */
    public Integer getEducationbgid() {
        return educationbgid;
    }

    /**
     * @param educationbgid
     */
    public void setEducationbgid(Integer educationbgid) {
        this.educationbgid = educationbgid;
    }

    /**
     * @return PhoneNumber
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * @param phonenumber
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    /**
     * @return Introduction
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * @param introduction
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * @return Email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
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
     * @return PhotoPath
     */
    public String getPhotopath() {
        return photopath;
    }

    /**
     * @param photopath
     */
    public void setPhotopath(String photopath) {
        this.photopath = photopath;
    }



}