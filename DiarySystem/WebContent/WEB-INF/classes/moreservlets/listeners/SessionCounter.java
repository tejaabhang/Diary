package moreservlets.listeners;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
/** Listener that keeps track of the number of sessions
 * that the Web application is currently using and has
 * ever used in its life cycle.
 */

public class SessionCounter implements HttpSessionListener {
  
public void sessionCreated(HttpSessionEvent event) {
   
}


public void sessionDestroyed(HttpSessionEvent event) {

	JOptionPane.showMessageDialog(null,"SESSION EXPIRED??? Please Login!!!");

}

}
