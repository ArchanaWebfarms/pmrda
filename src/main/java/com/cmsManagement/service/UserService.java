package com.cmsManagement.service;
import java.text.ParseException;
import java.util.List;
import java.util.Set;







import com.cmsManagement.dto.UserDto;
import com.cmsManagement.dto.UserRightsRoles;
import com.cmsManagement.model.Modules;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserOtp;
import com.cmsManagement.model.UserPermissions;

/**
 * @author ujwala_gawari
 *
 */
public interface UserService {
	
	
	/**
	 * returns Roles with a specific id
	 * @param roleID
	 * @return
	 */
	Roles getRoleByRoleID(int roleID);
	
	//Users
	/**
	 * returns list of all the users available
	 * @return
	 */
	List<User> findAllUser();
	
	/**
	 * adds a new User and return id.
	 * @param user
	 */
	int saveUser(User user);	
	
	/**
	 * update the existing User
	 * @param user
	 */
	boolean updateUser(User user);	
	
	/**
	 * returns users with a specific id
	 * @param userId
	 * @return
	 */
	User findUserById(int userId);
	
	/**
	 * Deactivate the existing User
	 * @param user
	 */
	boolean deleteUser(int userId);
	
	/**
	 * Updates the user password to new value provided.
	 * @param newHashedPassword
	 */
	boolean updatePassword(int userId, String newPassword);
	
	/**
	 * returns users with a specific user name.
	 * @param username
	 * @return
	 */
	User checkUsername(String username);
	
	/**
	 * returns users if name is already existed in User table.
	 * @param username
	 * @return
	 */
	User checkEditedUsername(String username, int user_id);
	List<User> getUserByUserID(int UserID);
	
	//Permissions
	
	/**
	 * returns list of all the Modules available.
	 * @return
	 */
	List<Modules> findAllModules();
	
	/**
	 * returns list of all the Permissions available for a specific module Id.
	 * @return
	 */
	List<Permissions> getModulesPermissions(int moduleID);
	int setUserPermission(int userID, int permissionID);
	boolean updateUserPermission(int userID, int permissionID);
    void deactivateUserPermission(int userID, int permissionID);
    List<Permissions> getListOfUserPermissions(int userId);
    List<User> getUserByRoleID(int roleID);
    
    /**
	 * returns User by user name.
	 * @param username
	 * @return
	 */
	User findByUsername(String username);
	
	/**
	 * returns list of all the User Permissions available for a specific User Id And  for specific module id.
	 * @param userID
	 * @return
	 */
	List<UserPermissions> getModulesPermissions1(int moduleID, int userID);
	
	/**
	 * returns list of all the User Permissions available for a specific User Id.
	 * @param userID
	 * @return
	 */
	List<UserPermissions> getListOfUserPermissions1(int userID);

	User findUserByEmail(String email);

	void saveUserOtp(User user, int otp);

	UserOtp getUserByOtp(int otp);

	void changePassword(int id, String password);

	void deleteOtp(int user_id);

	void increaseFailedAttempts(User users);

	void lock(User users);

	void resetFailedLoginAttept(User user);

	boolean unlockWhenTimeExpired(User users) throws ParseException;

	

	//List<UserPermissions> getPermissionsByModules(int moduleID);
	//List<Permissions> checkUserModule(int userId);
	//List<Permissions> getUserModulePermissions(int userId, int moduleID);
	//List<Permissions> checkUserModulePermissions(int userId, int moduleID);
	

	
	
	
}