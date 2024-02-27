package tech.unimart.unimart.utils;

public class EmailUtil {
    public static boolean sendPasswordResetEmail(String toEmail, String resetLink) {
//        final String username = "unimart.tech.info@gmail.com"; // change to your email
//        final String password = "Bmcgc20@"; // change to your email password
//
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//
//        Session session = Session.getInstance(props,
//                new jakarta.mail.Authenticator() {
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//            Message message = new MimeMessage(session);
//            // same as username or different as per your need
//            message.setFrom(new InternetAddress("from-email@gmail.com"));
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
//            message.setSubject("Password Reset");
//            message.setText("To reset your password, please click the link below:\n" + resetLink);
//
//            Transport.send(message);
//
//            System.out.println("Sent password reset email successfully....");
//
//            return true;
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return false;
//        }
        return true;
    }
}
