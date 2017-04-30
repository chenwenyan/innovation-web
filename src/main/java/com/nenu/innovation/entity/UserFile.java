package com.nenu.innovation.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Article
 *
 * @author: wychen
 * @time: 2017/4/7 21:07
 */

@Table(name = "t_file")
@Entity
public class UserFile {

    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "article_id")
    private Integer articleId;

    @Column(name = "path")
    private String path;

    @Column(name = "type")
    private String type;

    @Column(name = "size")
    private long size;

    @Column(name = "user_id")
    private Integer userId;

    @Transient
    private String userName;

    @Column(name = "download_num")
    private Integer downloadNum;

    @Column(name = "created_time")
    private Timestamp createdTime;

    @Column(name = "last_modified_time")
    private Timestamp lastModifiedTime;

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

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getDownloadNum() {
        return downloadNum;
    }

    public void setDownloadNum(Integer downloadNum) {
        this.downloadNum = downloadNum;
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
}
