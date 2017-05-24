package com.nenu.innovation.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * School
 *
 * @authr: wychen
 * @time: 2017/4/7 21:07
 */
@Table(name = "t_project")
@Entity
public class Project {

    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "charger")
    private String charger;

    @Column(name = "teacher")
    private String teacher;

    @Column(name = "school_id")
    private Integer schoolId;

    @Column(name = "school_name")
    private String schoolName;

    @Column(name = "created_time")
    private Timestamp createdTime;

    @Column(name = "last_modified_time")
    private Timestamp lastModifiedTime;

    @Column(name = "year")
    private Integer year;

    @Column(name = "type")
    private String type;

    @Column(name = "category")
    private String category;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCharger() {
        return charger;
    }

    public void setCharger(String charger) {
        this.charger = charger;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public Timestamp getLastModifiedTime() {
        return lastModifiedTime;
    }

    public void setLastModifiedTime(Timestamp lastModifiedTime) {
        this.lastModifiedTime = lastModifiedTime;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
