package tools;

import java.util.List;

public class PageUtil<T> {
	private int pageNumber;//总记录数   totalCount
	private int pageCount;//总页数   totalPage
	private int pageIndex;//当前页  currPage
	private int pageSize;//每页大小  pageSize
	private List<T>list;//当前页的数据   List<T> lists
	 //上一页
    private Integer prePage;
    //下一页
    private Integer nextPage;
	
	
	/**
     * 判断是否有上一页
     */
    public boolean isHasPreviouse(){
        if(pageIndex == 1)
            return false;
        return true;
    }
    /**
     * 判断是否有下一页
     */
    public boolean isHasNext(){
        if (pageIndex !=getLast())
            return false;
        return true;
    }
    
    /**
     * 计算得到尾页
     * @return
     */
    public int getLast(){
        int last;
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == pageNumber % pageSize)
            last = pageNumber - pageSize;
            // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else
            last = pageNumber - pageNumber % pageSize;

        last = last<0?0:last;
        return last;
    }
	
	public PageUtil() {
        super();
    }
	
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}

}
