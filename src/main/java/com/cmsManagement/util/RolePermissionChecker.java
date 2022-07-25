package com.cmsManagement.util;
import java.util.Locale;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.User;


/**
 * @author vinayak
 *
*/

public class RolePermissionChecker {

	
	/**
	 * Check if user has specific permission.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 */
	/*public static boolean hasUserGotPermission(final User user, final Permissions permissionName){
		boolean result = false;
		if(null == user){
			return false;
		}
		for(Permissions permission : user.get){
			if(permission.getPermissiontype().equals(permissionName)){
				result = true;
				break;
			}
		}
		return result;
	}*/
	
	
	
	/**
	 * Check if user has all the permissions mentioned.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 */
	/*public static boolean hasUserGotAllPermissions(final User user, final Permissions... permissionNames){
		boolean result = true;
		boolean hasPermission = false;
		if(null == user){
			return false;
		}
		for(Permissions permission : user.getRole().getPermissions()){
			hasPermission = false;
			for(PermissionName permissionName : permissionNames){
				if(permission.getPermissionName().equals(permissionName)){
					 hasPermission = true;
					 break;
				}
			}
			if(!hasPermission){
				return false;
			}
		}
		return result;
	}*/
	
	
	
	/**
	 * Check if user has any of the mentioned permission.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 */
	/*public static boolean hasUserGotAnyPermissions(final User user, final Permissions... permissionNames){
		boolean result = false;
		if(null == user){
			return false;
		}
		for(Permissions permission : user.getRole().getPermissions()){
			for(PermissionName permissionName : permissionNames){
				if(permission.getPermissionName().equals(permissionName)){
					return true;
				}
			}
		}
		return result;
	}*/
	
	
	
	
	/**
	 * Check if user has specific permission else throw @PmrdaPermissionException.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 * @throws PmrdaPermissionException 
	 */
	/*public static void validateUserHasPermission(final User user, final MessageSource messageSource, final Permissions permissionName) throws Exception {
		boolean result = false;
		if(null == user){
			String exceptionMessage = messageSource.getMessage("exception.user.not.loggedin", new Object[] {},  Locale.US);
			throw new PmrdaPermissionException(exceptionMessage);
		}
		for(Permissions permission : user.getRole().getPermissions()){
			if(permission.getPermissionName().equals(permissionName)){
				result = true;
				break;
			}
		}
		if(!result){
			String permissionNameText = messageSource.getMessage(permissionName.getKey(),null,Locale.US);
			String exceptionMessage = messageSource.getMessage("exception.user.role.permission", new Object[] {user.getUserName(), permissionNameText},  Locale.US);
			throw new PmrdaPermissionException(exceptionMessage);
		}
	}*/
	
	
	
	
	/**
	 * Check if user has all the permissions mentioned else throw @PmrdaPermissionException.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 * @throws PmrdaPermissionException 
	 */
	/*public static void validateUserHasAllPermissions(final User user, final MessageSource messageSource, final PermissionName... permissionNames) throws Exception{
		boolean hasPermission = false;
		if(null == user){
			String exceptionMessage = messageSource.getMessage("exception.user.not.loggedin", new Object[] {},  Locale.US);
			throw new PmrdaPermissionException(exceptionMessage);
		}
		for(Permissions permission : user.getRole().getPermissions()){
			hasPermission = false;
			for(PermissionName permissionName : permissionNames){
				if(permission.getPermissionName().equals(permissionName)){
					 hasPermission = true;
					 break;
				}
			}
			if(!hasPermission){
				String permissionNameText = messageSource.getMessage(permission.getPermissionName().getKey(),null,Locale.US);
				String exceptionMessage = messageSource.getMessage("exception.user.role.permission", new Object[] {user.getUserName(), permissionNameText},  Locale.US);
				throw new PmrdaPermissionException(exceptionMessage);
			}
		}
	}*/
	
	
	
	
	/**
	 * Check if user has any of the mentioned permission else throw @PmrdaPermissionException.
	 * 
	 * @param user
	 * @param permissionName
	 * @return Boolean true/false.
	 * @throws PmrdaPermissionException 
	 */
	/*public static void validateUserHasAnyPermissions(final User user, final MessageSource messageSource, final Permissions... permissionNames) throws Exception{
		boolean result = false;
		if(null == user){
			String exceptionMessage = messageSource.getMessage("exception.user.not.loggedin", new Object[] {},  Locale.US);
			throw new PmrdaPermissionException(exceptionMessage);
		}
		for(Permissions permission : user.getRole().getPermissions()){
			for(PermissionName permissionName : permissionNames){
				if(!result && permission.getPermissionName().equals(permissionName)){
					result = true;
					break;
				}
			}
		}
		if(!result){
			String exceptionMessage = messageSource.getMessage("exception.user.role.permission.no.permission", new Object[] {user.getUsername()},  Locale.US);
			throw new PmrdaPermissionException(exceptionMessage);
		}
	}*/
	
}
