package com.library.bean;

import java.util.List;

import tools.Pagetwo;




public class LimitPageList {
	private Pagetwo page;
    private List<?> list;
    public Pagetwo getPage() {
        return page;
    }
    public void setPage(Pagetwo page) {
        this.page = page;
    }
    public List<?> getList() {
        return list;
    }
    public void setList(List<?> list) {
        this.list = list;
    }
}
