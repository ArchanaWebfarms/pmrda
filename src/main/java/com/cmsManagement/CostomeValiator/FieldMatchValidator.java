
package com.cmsManagement.CostomeValiator;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {

    private String firstFieldName;
    private String secondFieldName;
    private String message;

    @Override
    public void initialize(final FieldMatch constraintAnnotation) {
        firstFieldName = constraintAnnotation.first();
        System.out.println(firstFieldName);
        secondFieldName = constraintAnnotation.second();
        System.out.println(secondFieldName);
        message = constraintAnnotation.message();
    }

    @Override
    public boolean isValid(final Object value, final ConstraintValidatorContext context) {
        boolean valid = true;
        try
        {
        	System.out.println(1);
            final Object firstObj = BeanUtils.getProperty(value, firstFieldName);
            System.out.println(firstObj);
            final Object secondObj = BeanUtils.getProperty(value, secondFieldName);
            System.out.println(secondObj);

            valid =  firstObj == null && secondObj == null || firstObj != null && firstObj.equals(secondObj);
            System.out.println(valid);
        }
        catch (final Exception ignore)
        {
            // ignore
        }

        if (!valid){
            context.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(firstFieldName)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }

        return valid;
    }
}