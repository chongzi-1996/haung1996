package myServlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;
import dao.Good;
import daoImpl.goodImpl;

/**
 * Servlet implementation class updategoods
 */
@WebServlet("/goodUpdate")
public class updategoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updategoods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String gid=null;
		String gname=null;
		String gcontent=null;
		String gprice=null;
		String gamount=null;
		String gimg="";
		String gkind=null;
		HttpSession session=request.getSession();
		String pic[]={".gif",".png",".jpg",".jpeg"};
		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		request.setCharacterEncoding("utf-8");
		if(isMultipart){
			FileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(factory);
			upload.setFileSizeMax(1024*1024*4);
			upload.setHeaderEncoding("utf-8");
			try{
				List<FileItem> fileItemList=upload.parseRequest(request);
				for(FileItem item:fileItemList){
					if(!item.isFormField()){
						InputStream stream=item.getInputStream();
						String fileName=item.getName();
						if(fileName!=null&&fileName.equals("")){
							fileName=FilenameUtils.getName(fileName);
						}
						boolean flag=false;
						for(int i=0;i<pic.length;i++){
							if(!fileName.endsWith(pic[i])){
								continue;
							}else{
								flag=true;
								break;
							}
						}
						if(!flag&&!fileName.equals("")){
							try{
								throw new Exception("文件格式不正确，请上传图片");
							}catch (Exception e) {
								e.printStackTrace();
							}
						}
						if(fileName!=null&&fileName.endsWith("")){
							String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
							fileName=getTime()+"."+prefix;
							Streams.copy(stream, new FileOutputStream(session.getServletContext().getRealPath("/")+"img/user/"+fileName),true);
							gimg="img/user/"+fileName;
						}
					}else{
						if(item.getFieldName().equals("gname")){
							gname=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}else if(item.getFieldName().equals("gprice")){
							gprice=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}else if(item.getFieldName().equals("gcontent")){
							gcontent=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}else if(item.getFieldName().equals("gamount")){
							gamount=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}else if(item.getFieldName().equals("gkind")){
							gkind=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}else if(item.getFieldName().equals("gid")){
							gid=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
		goodImpl goodimpl=new goodImpl();
		Good good=new Good();
		good.setGid(Integer.valueOf(gid));
		good.setGname(gname);
		good.setGcontent(gcontent);
		good.setGimg(gimg);
		good.setGamount(Integer.valueOf(gamount));
		good.setGprice(Double.valueOf(gprice));
		good.setGkind(gkind);
		int row=goodimpl.updateGood(good);
		if(row==1){
			out.println("<script>alert('修改成功');window.location.href='admin/manager/allGoods.jsp'</script>");	
		}else{
			out.println("<script>alert('修改失败');window.location.href='admin/manager/addGoods.jsp'</script>");	
		}
		}
	public String getTime(){
		SimpleDateFormat mydate=new SimpleDateFormat("yyyyMMdddHHmmssS");
		String nowtime=mydate.format(new Date());
		return nowtime;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
