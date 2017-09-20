package com.zsx.core.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ExceptionAspect {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    public ExceptionAspect() {
    }

    @Pointcut(value = "execution(* com.weshop..*.*(..))")
    private void point() {
    }

    @Before("point()")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("前置通知");
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
//        logger.debug(className + "的" + methodName + "执行了");
        System.out.println(className + "的" + methodName + "执行了");
        Object[] args = joinPoint.getArgs();
        StringBuilder log = new StringBuilder("入参为");
        for (Object arg : args) {
            log.append(arg + " ");
        }
//        logger.debug(log.toString());
        System.out.println(log.toString());
    }

    /**
     *  声明后置通知
     * @param result
     */
    @AfterReturning(pointcut = "point()", returning = "result")
    public void doAfterReturning(String result) {
        System.out.println("后置通知");
    }

    /**
     *  声明例外通知
     */
    @AfterThrowing(pointcut = "point()", throwing = "e")
    public void doAfterThrowing(Exception e) {
        System.out.println("例外通知");
    }

    /**
     *  声明最终通知
     */
    @After("point()")
    public void doAfter() {
        System.out.println("最终通知");
    }

    /**
     * 环绕通知
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around("point()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object[] args = null;
        try {
            args = joinPoint.getArgs();
            Object o = joinPoint.proceed();
            return o;
        } catch (Throwable e) {
            String lineBreak = System.getProperty("line.separator");
            StringBuilder sb2 = new StringBuilder();
            StackTraceElement[] stackTraces = e.getStackTrace();
            for (StackTraceElement stack : stackTraces) {
                sb2.append(stack.toString()).append(lineBreak);
            }
            System.out.println(sb2.toString());
            throw e;
        }
    }
}
