package com.cmsManagement.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cmsManagement.model.User;
import com.cmsManagement.service.UserService;

public class PasswordEncryptionSHA512 implements PasswordEncoder {
	
	@Autowired
	private UserService userService;
	
	private CaptchaCaptureFilter captchaCaptureFilter;

	public static String getSecurePassword(String password,byte[] salt) {

        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.reset();
            
            md.update(salt);
            byte[] bytes = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }

	@Override
	public String encode(CharSequence rawPassword) {
		return null;
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {		
		String username=captchaCaptureFilter.getUsernameResponse();
		
		User user=userService.findByUsername(username);
		String usrEncodedPassword=getSecurePassword(rawPassword.toString(),user.getPass_salt());
	
		if(usrEncodedPassword.equals(encodedPassword)){
			System.err.println("in if");
			return true;
		}else{
			System.err.println("in else");
			return false;
		}
		
	}

	public CaptchaCaptureFilter getCaptchaCaptureFilter() {
		return captchaCaptureFilter;
	}

	public void setCaptchaCaptureFilter(CaptchaCaptureFilter captchaCaptureFilter) {
		this.captchaCaptureFilter = captchaCaptureFilter;
	}

	
	
}
