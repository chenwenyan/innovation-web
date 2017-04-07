package com.nenu.innovation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Article
 *
 * @author: wychen
 * @time: 2017/4/7 21:07
 */

@Table(name = "t_article")
@Entity
public class Article {

    @Id
    private Integer id;

    @Column(name = "title")
    private String title;


}
