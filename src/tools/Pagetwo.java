package tools;

import java.io.Serializable;

public class Pagetwo implements Serializable{
	private static final long serialVersionUID = -3198048449643774660L;
    private int pageNow = 1; // 当前页数
    private int pageSize = 10; // 每页显示记录的条数
    private int totalCount; // 总记录条数
    private int totalPageCount; // 总页数
    private int startPos; // 开始位置，从0开始
    //构造函数,参数：总记录数和当前页
    public Pagetwo(int totalCount, int pageNow) {
        this.totalCount = totalCount;
        this.pageNow = pageNow;
    }
    //计算总页数，总页数=总记录数/每页显示记录的条数
    public int getTotalPageCount() {
        totalPageCount = getTotalCount() / getPageSize();
        return (totalCount % pageSize == 0) ? totalPageCount : totalPageCount + 1;
    }
    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }
    public int getPageNow() {
        return pageNow;
    }
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    //取得选择记录的初始位置
    public int getStartPos() {
        return (pageNow - 1) * pageSize;
    }
}
