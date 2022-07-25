package com.cmsManagement.dto;


public class GrantedPermission{
	
	public static String SUPER_ADMIN_ROLE="SUPERADMIN";
	public static String ADMIN_ROLE="ADMIN";
	public static String USER_ROLE="USER";
	public static String TEST_ROLE="test";
		
	public static String CREATE_USER= "CREATE_USER";
	public static String VIEW_USER= "VIEW_USER";
	public static String UPDATE_USER= "UPDATE_USER";
	public static String DELETE_USER= "DELETE_USER";
	public static String CHANGE_PASSWORD= "CHANGE_PASSWORD";
	
	public static String ADD_ROLE= "ADD_ROLE";
	public static String UPDATE_ROLE= "UPDATE_ROLE";
	public static String DELETE_ROLE= "DELETE_ROLE";
	
	
	public static String CREATE_ORDERS= "CREATE_ORDERS";
	public static String VIEW_ORDERS= "VIEW_ORDERS";
	public static String UPDATE_ORDERS = "UPDATE_ORDERS";
	public static String DELETE_ORDERS= "DELETE_ORDERS";	
	
	public static String CREATE_DOWNLOAD= "CREATE_DOWNLOAD";
	public static String VIEW_DOWNLOAD= "VIEW_DOWNLOAD";
	public static String UPDATE_DOWNLOAD= "UPDATE_DOWNLOAD";
	public static String DELETE_DOWNLOAD= "DELETE_DOWNLOAD";
	
	
	public static String VIEW_REPORTS= "VIEW_REPORTS";
	public static String VIEW_DATAREPORTS= "VIEW_DATAREPORTS";
	public static String VIEW_USERREPORTS= "VIEW_USERREPORTS";
	
	/***** Tender ****/
	public static String CREATE_TENDERS= "CREATE_TENDERS";
	public static String UPDATE_TENDERS= "UPDATE_TENDERS";
	public static String VIEW_TENDER= "VIEW_TENDERS";
	public static String DELETE_TENDER= "DELETE_TENDERS";
	
	/***** Notifications ******/
	public static String CREATE_NOTIFICATIONS= "CREATE_NOTIFICATIONS";
	public static String VIEW_NOTIFICATIONS= "VIEW_NOTIFICATIONS";
	public static String UPDATE_NOTIFICATIONS= "UPDATE_NOTIFICATIONS";
	public static String DELETE_NOTIFICATIONS= "DELETE_NOTIFICATIONS";	
	
	/***** News *****/
	public static String CREATE_NEWS= "CREATE_NEWS";
	public static String VIEW_NEWS= "VIEW_NEWS";
	public static String UPDATE_NEWS= "UPDATE_NEWS";
	public static String DELETE_NEWS= "DELETE_NEWS";	
	
	/***** Project *****/
	public static String CREATE_PROJECT= "CREATE_PROJECT";
	public static String VIEW_PROJECT= "VIEW_PROJECT";
	public static String UPDATE_PROJECT= "UPDATE_PROJECT";
	public static String DELETE_PROJECT= "DELETE_PROJECT";
	
	/***** Opening *****/
	public static String CREATE_OPENING= "CREATE_OPENING";
	public static String VIEW_OPENING= "VIEW_OPENING";
	public static String UPDATE_OPENING= "UPDATE_OPENING";
	public static String DELETE_OPENING= "DELETE_OPENING";
	public static String CLOSED_OPENING= "CLOSED_OPENING";
	
	/***** Department *****/
	public static String CREATE_DEPARTMENT= "CREATE_DEPARTMENT";
	public static String VIEW_DEPARTMENT= "VIEW_DEPARTMENT";
	public static String UPDATE_DEPARTMENT= "UPDATE_DEPARTMENT";
	public static String DELETE_DEPARTMENT= "DELETE_DEPARTMENT";
	
	public enum PermissionName {
		/*ADMIN_ROLE("ADMIN"),
		CREATE_USER("CREATE_USER"),
		VIEW_USER("VIEW_USER"),
		UPDATE_USER("UPDATE_USER"),
		DELETE_USER("DELETE_USER"),
		CHANGE_PASSWORD("CHANGE_PASSWORD"),*/
		/*ADD_ROLE("ADD_ROLE"),
		UPDATE_ROLE("UPDATE_ROLE"),
		DELETE_ROLE("DELETE_ROLE"),*/
		CREATE_NEWS("CREATE_NEWS"),
		VIEW_NEWS("VIEW_NEWS"),
		UPDATE_NEWS("UPDATE_NEWS"),
		DELETE_NEWS("DELETE_NEWS"),
		CREATE_TENDERS("CREATE_TENDERS"),
		UPDATE_TENDERS("UPDATE_TENDERS"),
		VIEW_TENDERS("VIEW_TENDERS"),
		DELETE_TENDERS("DELETE_TENDERS"),
		CREATE_NOTIFICATIONS("CREATE_NOTIFICATIONS"),
		VIEW_NOTIFICATIONS("VIEW_NOTIFICATIONS"),
		UPDATE_NOTIFICATIONS("UPDATE_NOTIFICATIONS"),
		DELETE_NOTIFICATIONS("DELETE_NOTIFICATIONS"),
		CREATE_PROJECT("CREATE_PROJECT"),
		VIEW_PROJECT("VIEW_PROJECT"),
		UPDATE_PROJECT("UPDATE_PROJECT"),
		DELETE_PROJECT("DELETE_PROJECT"),
		CREATE_OPENING("CREATE_OPENING"),
		VIEW_OPENING("VIEW_OPENING"),
		UPDATE_OPENING("UPDATE_OPENING"),
		DELETE_OPENING("DELETE_OPENING"),
		CLOSED_OPENING("CLOSED_OPENING"),
		CREATE_DEPARTMENT("CREATE_DEPARTMENT"),
		VIEW_DEPARTMENT("VIEW_DEPARTMENT"),
		UPDATE_DEPARTMENT("UPDATE_DEPARTMENT"),
		DELETE_DEPARTMENT("DELETE_DEPARTMENT");
		
		
		
		
		private String permission;
		
		private PermissionName(final String permission){
			this.permission = permission;
		}
		
		/**
		 * @return the permission name.
		 */
		public String getPermission(){
			return this.permission;
		}
	
		/**
		 * @param permission the permission to set
		 */
		public void setPermission(String permission) {
			this.permission = permission;
		}
		
		
		@Override
		public String toString(){
			return this.permission;
		}
	}	
}
