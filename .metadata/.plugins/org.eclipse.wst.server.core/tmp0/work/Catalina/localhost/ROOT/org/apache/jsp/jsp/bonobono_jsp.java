/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2019-04-30 03:40:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bonobono_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>보노보노</title>\r\n");
      out.write("<!--J-query  -->\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\r\n");
      out.write("<!--css  -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\" >\r\n");
      out.write("<!--bootstrap  -->\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/bootstrap.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("  @keyframes eyelf {\r\n");
      out.write("      0%{transform: rotate(25deg) scaleY(1);}\r\n");
      out.write("      2%{transform: rotate(25deg) scaleY(0);}\r\n");
      out.write("      10%{transform: rotate(25deg) scaleY(1);}\r\n");
      out.write("      100%{transform: rotate(25deg) scaleY(1);}\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @keyframes eyert {\r\n");
      out.write("      0%{transform: rotate(-25deg) scaleY(1);}\r\n");
      out.write("      2%{transform: rotate(-25deg) scaleY(0);}\r\n");
      out.write("      10%{transform: rotate(-25deg) scaleY(1);}\r\n");
      out.write("      100%{transform: rotate(-25deg) scaleY(1);}\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @keyframes riprt {\r\n");
      out.write("      0%{transform: rotate(-70deg); top:41%;}\r\n");
      out.write("      5%{transform: rotate(-73deg); top:40.5%;}\r\n");
      out.write("      15%{transform:rotate(-70deg); top:41%;}\r\n");
      out.write("      20%{transform:rotate(-73deg); top:40.5%;}\r\n");
      out.write("      25%{transform:rotate(-70deg); top:41%;}\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @keyframes riplf {\r\n");
      out.write("      0%{transform: rotate(70deg); top:41%;}\r\n");
      out.write("      5%{transform: rotate(73deg); top:40.5%;}\r\n");
      out.write("      15%{transform:rotate(70deg); top:41%;}\r\n");
      out.write("      20%{transform:rotate(73deg); top:40.5%;}\r\n");
      out.write("      25%{transform:rotate(70deg); top:41%;}\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    html, body{\r\n");
      out.write("      margin: 0;\r\n");
      out.write("      padding: 0;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .wrap{\r\n");
      out.write("      position: relative;\r\n");
      out.write("      margin-top: 40px;\r\n");
      out.write("      transform: scale(0.5);\r\n");
      out.write("      \r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .bono{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 1000px;\r\n");
      out.write("      height: 1000px;\r\n");
      out.write("      background: rgb(123, 196, 255);\r\n");
      out.write("      left: 51%;\r\n");
      out.write("      top:-30px;\r\n");
      out.write("      transform: translateX(-50%);\r\n");
      out.write("      border-radius: 50%;\r\n");
      out.write("      transition: 0.5s ease;\r\n");
      out.write("      transform-origin: center;\r\n");
      out.write("      overflow: hidden;\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .bono:hover{\r\n");
      out.write("      transform: translateX(-50%) rotate(5deg);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .nose{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 160px;\r\n");
      out.write("      height: 160px;\r\n");
      out.write("      border-radius: 50%;\r\n");
      out.write("      background: rgb(23, 23, 23);\r\n");
      out.write("      top: 45%;\r\n");
      out.write("      left: 50%;\r\n");
      out.write("      transform: translate(-50%, -50%);\r\n");
      out.write("      z-index: 100;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    img{\r\n");
      out.write("      display:block;\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      z-index: -100;\r\n");
      out.write("      left: 50%;\r\n");
      out.write("      transform: translateX(-50%);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .eye{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 50px;\r\n");
      out.write("      height: 60px;\r\n");
      out.write("      top: 32%;\r\n");
      out.write("      border-radius: 50% / 60% 60% 50% 50%;\r\n");
      out.write("      background: rgb(23, 23, 23);\r\n");
      out.write("      transition: 0.1s;\r\n");
      out.write("      transform-origin: center;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .eye.lf{\r\n");
      out.write("      left: 80px;\r\n");
      out.write("      transform: rotate(25deg) scaleY(1);\r\n");
      out.write("      animation: eyelf 3s infinite;\r\n");
      out.write("      animation-delay: 2s;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .eye.rt{\r\n");
      out.write("      right: 80px;\r\n");
      out.write("      transform: rotate(-25deg) scaleY(1);\r\n");
      out.write("      animation: eyert 3s infinite;\r\n");
      out.write("      animation-delay: 2s;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    .inner{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 18px;\r\n");
      out.write("      height: 25px;\r\n");
      out.write("      top: 7px;\r\n");
      out.write("      background: rgb(255, 255, 255);\r\n");
      out.write("      border-radius: 50% / 60% 60% 50% 50%;\r\n");
      out.write("      transition: 0.2s;\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .eye.lf .inner{\r\n");
      out.write("      left: 20px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .eye.rt .inner{\r\n");
      out.write("      right: 20px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 220px;\r\n");
      out.write("      height: 280px;\r\n");
      out.write("      border-radius: 50% / 60% 60% 40% 40%;\r\n");
      out.write("      background: rgb(255, 255, 255);\r\n");
      out.write("      z-index: -10;\r\n");
      out.write("\r\n");
      out.write("      box-sizing: border-box;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.rt{\r\n");
      out.write("      transform: rotate(-70deg);\r\n");
      out.write("      right: 25%;\r\n");
      out.write("      top: 41%;\r\n");
      out.write("      animation: riprt 5s infinite;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.lf{\r\n");
      out.write("      transform: rotate(70deg);\r\n");
      out.write("      left: 25%;\r\n");
      out.write("      top: 41%;\r\n");
      out.write("      animation: riplf 5s infinite;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .mouse{\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      width: 200px;\r\n");
      out.write("      height: 320px;\r\n");
      out.write("      border-radius: 50%/ 40% 40% 60% 60%;\r\n");
      out.write("      background: rgb(255, 149, 254);\r\n");
      out.write("      left: 50%;\r\n");
      out.write("      transform: translateX(-50%);\r\n");
      out.write("      top: 50%;\r\n");
      out.write("      z-index: -20;\r\n");
      out.write("      transform-origin: center;\r\n");
      out.write("      transition: 0.5s ease-out;\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .line1, .line2, .line3{\r\n");
      out.write("      width: 200px;\r\n");
      out.write("      height: 6px;\r\n");
      out.write("      background: rgb(23, 23, 23);\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      border-radius: 5px;\r\n");
      out.write("      transition: 0.5s ease;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.lf .line1{\r\n");
      out.write("      transform-origin: right top;\r\n");
      out.write("      top: 170px;\r\n");
      out.write("      right: 150px;\r\n");
      out.write("      transform: rotate(-60deg);\r\n");
      out.write("      animation:\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    .rip.lf .line2{\r\n");
      out.write("      transform-origin: right top;\r\n");
      out.write("      top: 190px;\r\n");
      out.write("      right: 120px;\r\n");
      out.write("      transform: rotate(-70deg);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.lf .line3{\r\n");
      out.write("      transform-origin: right top;\r\n");
      out.write("      top: 194px;\r\n");
      out.write("      right: 90px;\r\n");
      out.write("      transform: rotate(-96deg);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.rt .line1{\r\n");
      out.write("      transform-origin: left top;\r\n");
      out.write("      top: 200px;\r\n");
      out.write("      left: 160px;\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      transform: rotate(55deg);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.rt .line2{\r\n");
      out.write("      transform-origin: left top;\r\n");
      out.write("      top: 210px;\r\n");
      out.write("      left: 120px;\r\n");
      out.write("      transform: rotate(73deg);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .rip.rt .line3{\r\n");
      out.write("      transform-origin: left top;\r\n");
      out.write("      top: 210px;\r\n");
      out.write("      left: 96px;\r\n");
      out.write("      transform: rotate(93deg);\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"wrap\" align=\"center\" >\r\n");
      out.write("      <div class=\"bono\">\r\n");
      out.write("        <div class=\"eye lf\">\r\n");
      out.write("          <div class=\"inner\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"eye rt\">\r\n");
      out.write("          <div class=\"inner\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"nose\"></div>\r\n");
      out.write("        <div class=\"rip lf\">\r\n");
      out.write("          <div class=\"line1\"></div>\r\n");
      out.write("          <div class=\"line2\"></div>\r\n");
      out.write("          <div class=\"line3\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"rip rt\">\r\n");
      out.write("          <div class=\"line1\"></div>\r\n");
      out.write("          <div class=\"line2\"></div>\r\n");
      out.write("          <div class=\"line3\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"mouse\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
