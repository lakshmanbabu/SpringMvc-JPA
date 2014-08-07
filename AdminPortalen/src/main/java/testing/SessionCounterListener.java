package testing;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 


public class SessionCounterListener implements HttpSessionListener {
 
  private static int totalActiveSessions;
 
  public static int getTotalActiveSession(){
	return totalActiveSessions;
  }
 
  @Override
  public void sessionCreated(HttpSessionEvent arg0) {
	totalActiveSessions++;
	System.out.println("sessionCreated - add one session into counter");
	
  }
 
  @SuppressWarnings("null")
@Override
  public void sessionDestroyed(HttpSessionEvent arg0) {
	
	System.out.println("sessionDestroyed - deduct one session from counter");
	/*HttpServletResponse response =null;
	
			try {
				response.sendRedirect("/lockscreen");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/

	totalActiveSessions--;
  }	
  
}
