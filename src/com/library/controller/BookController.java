package com.library.controller;

import com.library.bean.Book;
import com.library.bean.Lend;
import com.library.bean.LimitPageList;
import com.library.bean.ReaderCard;
import com.library.dao.BookDao;
import com.library.service.BookService;
import com.library.service.LendService;

import tools.Page;
import tools.PageUtil;
import tools.Pagetwo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.JavaFileObject;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private LendService lendService;
 
    @RequestMapping("/admin_books.html")
    public ModelAndView getList(HttpServletRequest request, Model model){
    	int pageIndex = 1;
    	int pageSize = 10;
    	PageUtil<Book> pageUtil = new PageUtil<Book>();
    	List<Book> books = new ArrayList<Book>();
    	if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }
    	pageUtil.setPageIndex(pageIndex);
    	int number = bookService.getTotal();
    	pageUtil.setPageNumber(number);
    	pageUtil.setPageSize(pageSize);
    	pageUtil.setPageCount((int) Math.ceil((double) (pageUtil
                .getPageNumber() / pageUtil.getPageSize())) + 1);
    	int index = (pageIndex - 1) * pageSize;
    	books = bookService.getlist(index);
    	pageUtil.setList(books);
    	model.addAttribute("pageUtil", pageUtil);
    	model.addAttribute("books", books);
    	return new ModelAndView("admin_books");
    }


    private Date getDate(String pubstr) {
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            return df.parse(pubstr);
        } catch (ParseException e) {
            e.printStackTrace();
            return new Date();
        }
    }
    
    

    @RequestMapping("/querybook.html")
    public ModelAndView queryBookDo(HttpServletRequest req,HttpServletResponse resq,Model model) throws ServletException, IOException{
    	HashMap<String,Object> map = new HashMap<String,Object>();
		PageUtil<Book> pageUtil= new PageUtil<Book>();
		req.setCharacterEncoding("UTF-8");
        int pageIndex = 1;
        if (req.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
        }
        pageUtil.setPageIndex(pageIndex);
		String searchWord=req.getParameter("searchWord");
		if (bookService.matchBook(searchWord)) {
			int pageSize=10;
	        pageUtil.setPageSize(pageSize);
	        int pageNumber = bookService.selectPacketCountName(searchWord);
	        pageUtil.setPageNumber(pageNumber);
	        double tc=pageNumber;
	        double ps=pageSize;
	        Double pageCount =Math.ceil(tc/ps);
	        pageUtil.setPageCount(pageCount.intValue());
	        map.put("start",(pageIndex-1)*pageSize);
	        map.put("size", pageUtil.getPageSize());
	        map.put("searchWord", searchWord);
	        List<Book> books = bookService.selectPacketName(map);
	  		pageUtil.setList(books);
	  		model.addAttribute("pageUtil",pageUtil);
	  		model.addAttribute("books",books);
	  		return  new ModelAndView("admin_books");
			} else {
	          return new ModelAndView("admin_books", "error", "没有匹配的图书");
	      }
		}
		
    @RequestMapping("/reader_querybook_do.html")
	public ModelAndView selectPacketName(HttpServletRequest req,HttpServletResponse resq,Model model)throws ServletException, IOException{
		//新建对象
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageUtil<Book> pageUtil= new PageUtil<Book>();
        
        //封装当前页数
        req.setCharacterEncoding("UTF-8");
        int pageIndex = 1;
        if (req.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
        }
        pageUtil.setPageIndex(pageIndex);
		String searchWord=req.getParameter("searchWord");
		if (bookService.matchBook(searchWord)) {
 
        //每页显示的数据
        int pageSize=10;
        pageUtil.setPageSize(pageSize);
 
        //封装总记录数
        int pageNumber = bookService.selectPacketCountName(searchWord);
        pageUtil.setPageNumber(pageNumber);
 
        //封装总页数,向上取整
        double tc=pageNumber;
        double ps=pageSize;
        Double pageCount =Math.ceil(tc/ps);
        pageUtil.setPageCount(pageCount.intValue());
        map.put("start",(pageIndex-1)*pageSize);
        map.put("size", pageUtil.getPageSize());
        map.put("searchWord", searchWord);
        
        //model把分页信息pageBean和查询信息list传递给前端
  		List<Book> books = bookService.selectPacketName(map);
  		pageUtil.setList(books);
  		model.addAttribute("pageUtil",pageUtil);
  		model.addAttribute("books",books);
  		return  new ModelAndView("reader_books");
		} else {
          return new ModelAndView("reader_books", "error", "没有匹配的图书");
      }
	}
    
    
    @RequestMapping("/reader_querybook_do2.html")
   	public ModelAndView selectPacketName2(HttpServletRequest req,HttpServletResponse resq,Model model)throws ServletException, IOException{
   		//新建对象
   		HashMap<String,Object> map = new HashMap<String,Object>();
   		PageUtil<Book> pageUtil= new PageUtil<Book>();
   		String searchWord=req.getParameter("searchWord");
           //封装当前页数
           req.setCharacterEncoding("UTF-8");
           int pageIndex = 1;
           if (req.getParameter("pageIndex") != null) {
               pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
           }
           pageUtil.setPageIndex(pageIndex);
   		
    
           //每页显示的数据
           int pageSize=10;
           pageUtil.setPageSize(pageSize);
    
           //封装总记录数
           int pageNumber = bookService.selectPacketCountName(searchWord);
           pageUtil.setPageNumber(pageNumber);
    
           //封装总页数,向上取整
           double tc=pageNumber;
           double ps=pageSize;
           Double pageCount =Math.ceil(tc/ps);
           pageUtil.setPageCount(pageCount.intValue());
           map.put("start",(pageIndex-1)*pageSize);
           map.put("size", pageUtil.getPageSize());
           map.put("searchWord", searchWord);
           
           //model把分页信息pageBean和查询信息list传递给前端
     		List<Book> books = bookService.selectPacketName(map);
     		pageUtil.setList(books);
     		model.addAttribute("pageUtil",pageUtil);
     		model.addAttribute("books",books);
     		return  new ModelAndView("reader_books");
   		}
    
    
    
    
    
    
    
    

//    @RequestMapping("/reader_querybook_do.html")
//    public ModelAndView readerQueryBookDo(String searchWord) {
//        if (bookService.matchBook(searchWord)) {
//            ArrayList<Book> books = bookService.queryBook(searchWord);
//            ModelAndView modelAndView = new ModelAndView("reader_books");
//            modelAndView.addObject("books", books);
//            return modelAndView;
//        } else {
//            return new ModelAndView("reader_books", "error", "没有匹配的图书");
//        }
//    }

    @RequestMapping("/admin_books1.html")
    public ModelAndView adminBooks() {
        ArrayList<Book> books = bookService.getAllBooks();
        ModelAndView modelAndView = new ModelAndView("admin_books");
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("/book_add.html")
    public ModelAndView addBook() {
        return new ModelAndView("admin_book_add");
    }

//    @RequestMapping("/book_add_do.html")
//    public String addBookDo(Book book, RedirectAttributes redirectAttributes) {
//        //book.setPubdate(getDate(pubstr));
//        if(bookService.selectBookByIsbn(book.getIsbn())){
//            redirectAttributes.addFlashAttribute("succ", "ISBN重复，图书添加失败！");
//        }else{
//            if (bookService.addBook(book)) {
//                redirectAttributes.addFlashAttribute("succ", "图书添加成功！");
//            } else {
//                redirectAttributes.addFlashAttribute("succ", "图书添加失败！");
//            }
//        }
//        return "redirect:/admin_books.html";
//    }
    @RequestMapping("/book_add_do.html")
    public String addBook(Book book,MultipartFile file,RedirectAttributes redirectAttributes,ModelMap map) throws IOException {
    	 if(bookService.selectBookByIsbn(book.getIsbn())){
    		 redirectAttributes.addFlashAttribute("succ", "ISBN重复，图书添加失败！");
          }else{
        	  redirectAttributes.addFlashAttribute("succ", "图书添加成功！");
        	  return bookService.addBook(book, file, map);
          }
    	 return "redirect:/admin_books.html";
    }
    

    @RequestMapping("/updatebook.html")
    public ModelAndView bookEdit(HttpServletRequest request) {
        long bookId = Long.parseLong(request.getParameter("bookId"));
        Book book = bookService.getBook(bookId);
        ModelAndView modelAndView = new ModelAndView("admin_book_edit");
        modelAndView.addObject("detail", book);
        return modelAndView;
    }

    //修改图书信息
    @RequestMapping("/book_edit_do.html")
    public String bookEditDo( Book book, RedirectAttributes redirectAttributes) {
        if (bookService.editBook(book)) {
            redirectAttributes.addFlashAttribute("succ", "图书修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "图书修改失败！");
        }
        return "redirect:/admin_books.html";
    }
//  //修改图书信息（包含图片）
//  @RequestMapping("/book_edit_do.html")
//  public String bookEditDo(Book book,MultipartFile file,RedirectAttributes redirectAttributes,ModelMap map)throws IOException  {
//      if (bookService.editBook(book)) {
//          redirectAttributes.addFlashAttribute("succ", "图书修改成功！");
//      } else {
//          redirectAttributes.addFlashAttribute("error", "图书修改失败！");
//      }
//      return "redirect:/admin_books.html";
//  }
    
    
    
    

    @RequestMapping("/admin_book_detail.html")
    public ModelAndView adminBookDetail(HttpServletRequest request) {
        long bookId = Long.parseLong(request.getParameter("bookId"));
        Book book = bookService.getBook(bookId);
        ModelAndView modelAndView = new ModelAndView("admin_book_detail");
        modelAndView.addObject("detail", book);
        return modelAndView;
    }

    @RequestMapping("/reader_book_detail.html")
    public ModelAndView readerBookDetail(HttpServletRequest request) {
        long bookId = Long.parseLong(request.getParameter("bookId"));
        Book book = bookService.getBook(bookId);
        ModelAndView modelAndView = new ModelAndView("reader_book_detail");
        modelAndView.addObject("detail", book);
        return modelAndView;
    }

    @RequestMapping("/admin_header.html")
    public ModelAndView admin_header() {
        return new ModelAndView("admin_header");
    }

    @RequestMapping("/reader_header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader_header");
    }

//    @RequestMapping("/reader_books.html")
//    public ModelAndView readerBooks(HttpServletRequest request) {
//        ArrayList<Book> books = bookService.getAllBooks();
//        ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
//        ArrayList<Lend> myAllLendList = lendService.myLendList(readerCard.getReaderId());
//        ArrayList<Long> myLendList = new ArrayList<>();
//        for (Lend lend : myAllLendList) {
//            // 是否已归还
//            if (lend.getBackDate() == null) {
//                myLendList.add(lend.getBookId());
//                for(Book book : books){
//                    if(book.getBookId()==lend.getBookId()){
//                        book.setOverDate(processDate(lend.getLendDate()));
//                    }
//                }
//            }
//        }
//        ModelAndView modelAndView = new ModelAndView("reader_books");
//        modelAndView.addObject("books", books);
//        modelAndView.addObject("myLendList", myLendList);
//        return modelAndView;
//    }
    //读者图书信息进行分页
    @RequestMapping("/reader_books.html")
    public ModelAndView readerBooks(HttpServletRequest request,Model model) {
    	int pageIndex = 1;
    	int pageSize = 10;
    	PageUtil<Book> pageUtil = new PageUtil<Book>();
    	List<Book> books = new ArrayList<Book>();
    	if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }
    	pageUtil.setPageIndex(pageIndex);
    	int number = bookService.getTotal();
    	pageUtil.setPageNumber(number);
    	pageUtil.setPageSize(pageSize);
    	pageUtil.setPageCount((int) Math.ceil((double) (pageUtil
                .getPageNumber() / pageUtil.getPageSize())) + 1);
    	int index = (pageIndex - 1) * pageSize;
    	books = bookService.getlist(index);
    	ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
    	ArrayList<Lend> myAllLendList = lendService.myLendList(readerCard.getReaderId());
    	ArrayList<Long> myLendList = new ArrayList<>();
    	for (Lend lend : myAllLendList) {
          // 是否已归还
          if (lend.getBackDate() == null) {
              myLendList.add(lend.getBookId());
              for(Book book : books){
                  if(book.getBookId()==lend.getBookId()){
                      book.setOverDate(processDate(lend.getLendDate()));
                  }
              }
          }
      }
    	
    	
    	pageUtil.setList(books);
    	model.addAttribute("pageUtil", pageUtil);
    	model.addAttribute("books", books);
    	model.addAttribute("myLendList", myLendList);
    	return new ModelAndView("reader_books");
    }
    
    


    public static String processDate(Date lendDate)
    {
        int m = 0;
        Date date = new Date();
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(lendDate);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date);
        int day1= cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);

        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if(year1 != year2) //同一年
        {
            int timeDistance = 0 ;
            for(int i = year1 ; i < year2 ; i ++)
            {
                if(i%4==0 && i%100!=0 || i%400==0) //闰年
                {
                    timeDistance += 366;
                }
                else //不是闰年
                {
                    timeDistance += 365;
                }
            }

           m =   timeDistance + (day2-day1) ;
        }
        else //不同年
        {
            //System.out.println("判断day2 - day1 : " + (day2-day1));
            m =  day2-day1;
        }
        if(m>3){
            m = m -3;
            return "逾期：" +m  +"天";
        }else{
            return "尚在借书期限内";
        }
    }
}
