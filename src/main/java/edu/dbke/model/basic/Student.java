package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_student")
public class Student {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Profession")
    private Integer profession;

    @Column(name = "LearnYear")
    private Integer learnyear;

    @Column(name = "LearnType")
    private Integer learntype;

    @Column(name = "LearnLevel")
    private Integer learnlevel;

    @Column(name = "LearnLong")
    private Integer learnlong;

    @Column(name = "JoinDate")
    private Date joindate;

    @Column(name = "Name")
    private String name;

    @Column(name = "Sex")
    private String sex;

    @Column(name = "IdentityNo")
    private String identityno;

    @Column(name = "LoginPassword")
    private String loginpassword;

    @Column(name = "Birthday")
    private Date birthday;

    @Column(name = "Photo")
    private String photo;

    @Column(name = "OriginPlace")
    private String originplace;

    @Column(name = "Nation")
    private String nation;

    @Column(name = "LinkPhone")
    private String linkphone;

    @Column(name = "Email")
    private String email;

    @Column(name = "HomeAddress")
    private String homeaddress;

    @Column(name = "CurrentClassId")
    private Integer currentclassid;

    @Column(name = "Status")
    private Integer status;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "LastEditUser")
    private String lastedituser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    @Column(name = "StudentNo")
    private String studentno;

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
     * @return Profession
     */
    public Integer getProfession() {
        return profession;
    }

    /**
     * @param profession
     */
    public void setProfession(Integer profession) {
        this.profession = profession;
    }

    /**
     * @return LearnYear
     */
    public Integer getLearnyear() {
        return learnyear;
    }

    /**
     * @param learnyear
     */
    public void setLearnyear(Integer learnyear) {
        this.learnyear = learnyear;
    }

    /**
     * @return LearnType
     */
    public Integer getLearntype() {
        return learntype;
    }

    /**
     * @param learntype
     */
    public void setLearntype(Integer learntype) {
        this.learntype = learntype;
    }

    /**
     * @return LearnLevel
     */
    public Integer getLearnlevel() {
        return learnlevel;
    }

    /**
     * @param learnlevel
     */
    public void setLearnlevel(Integer learnlevel) {
        this.learnlevel = learnlevel;
    }

    /**
     * @return LearnLong
     */
    public Integer getLearnlong() {
        return learnlong;
    }

    /**
     * @param learnlong
     */
    public void setLearnlong(Integer learnlong) {
        this.learnlong = learnlong;
    }

    /**
     * @return JoinDate
     */
    public Date getJoindate() {
        return joindate;
    }

    /**
     * @param joindate
     */
    public void setJoindate(Date joindate) {
        this.joindate = joindate;
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
     * @return IdentityNo
     */
    public String getIdentityno() {
        return identityno;
    }

    /**
     * @param identityno
     */
    public void setIdentityno(String identityno) {
        this.identityno = identityno;
    }

    /**
     * @return LoginPassword
     */
    public String getLoginpassword() {
        return loginpassword;
    }

    /**
     * @param loginpassword
     */
    public void setLoginpassword(String loginpassword) {
        this.loginpassword = loginpassword;
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
     * @return Photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * @param photo
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * @return OriginPlace
     */
    public String getOriginplace() {
        return originplace;
    }

    /**
     * @param originplace
     */
    public void setOriginplace(String originplace) {
        this.originplace = originplace;
    }

    /**
     * @return Nation
     */
    public String getNation() {
        return nation;
    }

    /**
     * @param nation
     */
    public void setNation(String nation) {
        this.nation = nation;
    }

    /**
     * @return LinkPhone
     */
    public String getLinkphone() {
        return linkphone;
    }

    /**
     * @param linkphone
     */
    public void setLinkphone(String linkphone) {
        this.linkphone = linkphone;
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
     * @return HomeAddress
     */
    public String getHomeaddress() {
        return homeaddress;
    }

    /**
     * @param homeaddress
     */
    public void setHomeaddress(String homeaddress) {
        this.homeaddress = homeaddress;
    }

    /**
     * @return CurrentClassId
     */
    public Integer getCurrentclassid() {
        return currentclassid;
    }

    /**
     * @param currentclassid
     */
    public void setCurrentclassid(Integer currentclassid) {
        this.currentclassid = currentclassid;
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
     * @return StudentNo
     */
    public String getStudentno() {
        return studentno;
    }

    /**
     * @param studentno
     */
    public void setStudentno(String studentno) {
        this.studentno = studentno;
    }
}