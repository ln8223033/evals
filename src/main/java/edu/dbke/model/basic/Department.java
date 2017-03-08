package edu.dbke.model.basic;

import javax.persistence.*;
import java.util.Date;

@Table(name = "t_department")
public class Department {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 校区ID
     */
    @Column(name = "SchoolCampusId")
    private Integer schoolcampusid;

    /**
     * 学院名称
     */
    @Column(name = "Name")
    private String name;

    /**
     * 学院编号
     */
    @Column(name = "Number")
    private String number;

    @Column(name = "InDate")
    private Date indate;

    @Column(name = "InUser")
    private String inuser;

    @Column(name = "LastEditDate")
    private Date lasteditdate;

    @Column(name = "LastEditUser")
    private String lastedituser;

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
     * 获取学院名称
     *
     * @return Name - 学院名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置学院名称
     *
     * @param name 学院名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取学院编号
     *
     * @return Number - 学院编号
     */
    public String getNumber() {
        return number;
    }

    /**
     * 设置学院编号
     *
     * @param number 学院编号
     */
    public void setNumber(String number) {
        this.number = number;
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
}