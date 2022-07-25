package com.cmsManagement.util;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import org.springframework.jdbc.datasource.DriverManagerDataSource;


public class SecureDataSource extends DriverManagerDataSource {

	
	private String username;
	private String password;

	@Override
	protected Connection getConnectionFromDriverManager(String url,	Properties props) throws SQLException {
		try {
			Properties properties = new Properties(); // Create Properties
			properties.put("user", username); // Set user ID for connection
			properties.put("password", decryptPassword(password)); // Set password for connection
			return super.getConnectionFromDriverManager(url, properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static String decryptPassword(String encryptedPassword) throws Exception {

		// decrypt the password.
		String decryptionPasswordKey = null;

		try {
			if (encryptedPassword.startsWith("ENC(") && encryptedPassword.endsWith(")")){
				
				// COMMENTED SINCE WE ARE NOT SEETING JASYPT_ENCRYPTION_KEY in ENVIRONMENT VARIABLE
/*				String decryptionPassword = System.getenv(ENCRYPTION_KEY_ENV_VAR);
				if (decryptionPassword == null) {
					throw new Exception(ENCRYPTION_KEY_ENV_VAR + " env variable not found!");
				}
*/
				/*decryptionPasswordKey = Constants.JASYPT_ENCRYPTION_KEY;
				
				StandardPBEStringEncryptor strongEncryptor = new StandardPBEStringEncryptor();
				strongEncryptor.setAlgorithm("PBEWithMD5AndDES");
				strongEncryptor.setPassword(decryptionPasswordKey);

				//Extract the string between "ENC(....)"
				encryptedPassword = encryptedPassword.substring(4, encryptedPassword.length()-1);
				decryptionPasswordKey = strongEncryptor.decrypt(encryptedPassword);*/
			}
			else{
				decryptionPasswordKey=encryptedPassword;
			}
		} 
		catch (Exception e) {
			throw new Exception("Error decrypting db password.", e);
		}

		return decryptionPasswordKey;

	}
}
