package edu.dbke.model.basic;

import javax.persistence.*;

@Table(name = "t_coursegroup")
public class Coursegroup {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Name")
    private String name;

    /**
     * 默认状态为1
     */
    @Column(name = "Status")
    private Integer status;


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
     * 获取默认状态为1
     *
     * @return Status - 默认状态为1
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置默认状态为1
     *
     * @param status 默认状态为1
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

}