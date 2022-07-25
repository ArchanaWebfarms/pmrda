package com.cmsManagement.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@Aspect
//@EnableAspectJAutoProxy
public class EmployeeCRUDAspect {
	  @Before("execution(* NewsController.newsDashboard())") 
	    public void logBeforeV1(JoinPoint joinPoint)
	    {
	        System.out.println("NewsController.newsDashboard() : " + joinPoint.getSignature().getName());
	    }
}
