package com.hos.util;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Emails {
	
		private final static String myEmailSMTPHost = "smtp.163.com";
		private final static String myEmailAccount = "w0301jhospital@163.com";
		private final static String myEmailPassword = "hospital";
		
    	public void email(String receiveMailAccount, String name,String dename,Double bcost,String date,String sex,Integer starttime){
    	
    		  Properties props = new Properties();                    // 参数配置
    	        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
    	        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
    	        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

    	        Session session = Session.getDefaultInstance(props);
    	        session.setDebug(true);// 设置为debug模式, 可以查看详细的发送 log

    	        MimeMessage message;
				try {
					message = createMimeMessage(session, myEmailAccount, receiveMailAccount,name, dename, bcost,date,sex,starttime);
					
					Transport transport = session.getTransport();
					
				     transport.connect(myEmailAccount, myEmailPassword);

		    	      transport.sendMessage(message, message.getAllRecipients());

		    	     transport.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

    	}
    	
    	
    	  /**
         * 创建一封只包含文本的简单邮件
         *
         * @param session 和服务器交互的会话
         * @param sendMail 发件人邮箱
         * @param receiveMail 收件人邮箱
         * @return
         * @throws Exception
         */
       public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,
    		   String name,String dename,Double bcost,String date,String sex,Integer starttime) throws Exception {
    	   SimpleDateFormat sdf= new SimpleDateFormat("yyyy年M月d日");
    	   String today = sdf.format(new Date());
    	   String noon = starttime>0?"下午":"上午";
    	   String time = starttime>0?"15:00":"11:00";
    	   
            // 创建一封邮件
            MimeMessage message = new MimeMessage(session);

            // From: 发件人
            message.setFrom(new InternetAddress(sendMail, "湖南省三零一医院", "UTF-8"));

            // To: 收件人
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "用户", "UTF-8"));

            //  Subject: 邮件主题
            message.setSubject("您的预约挂号通知", "UTF-8");

            // Content: 邮件正文
            System.out.println("sex"+sex);
            String gender ="男".equals(sex)?"先生":"女士";
            message.setContent("<h4>"+name+gender+"，您好！</h4>您已预约了我院"+date+noon+"的"+dename+"门诊，挂号费为"+bcost+"元，"
            		+ "请届时携带身份证及诊疗卡（如无卡需到院办理）于"+time+"之前在一楼大厅挂号收费窗口办理缴费取号手续。祝您身体健康，万事如意！<p style='text-align:right;'>by:湖南省三零一医院</p>"
            		+ "<p style='text-align:right;'>"+today+"</p>", "text/html;charset=UTF-8");

            // 设置发件时间
            message.setSentDate(new Date());

            // 保存设置
            message.saveChanges();

            // 将该邮件保存到本地
            OutputStream out = new FileOutputStream("MyEmail.eml");
            message.writeTo(out);
            out.flush();
            out.close();
            
            return message;
        }
}
