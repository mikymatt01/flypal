package model;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;

public class Utente {
	private String username,email,password,salt;
	private int admin;
	
	public Utente(String user, String email, int adm) {
		username = user;
		this.email = email;
		admin = adm;
	}
	
	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHashPassword() {
		return password;
	}

	public void setHashPassword(String password) {
		// generate salt
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		this.salt = String.format("%040x", new BigInteger(1, salt));
		
		// generate encrypted password
		PBEKeySpec spec = new PBEKeySpec(password.toCharArray(),salt,65536,128);
		try {
			SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			byte[] hashed = factory.generateSecret(spec).getEncoded();
			this.password = String.format("%040x", new BigInteger(1, hashed));
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			throw new RuntimeException(e);
		} 
	}

	public boolean isAdmin() {
		if(admin == 0)
			return false;
		else
			return true;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSalt() {
		return salt;
	}
}
