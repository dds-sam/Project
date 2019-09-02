package cn.dds.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice//全局异常处理类
public class GlobalExceptionHandler {
    @ExceptionHandler(value = ResourcesNotExistException.class)
     public ModelAndView resourcesNotExist(HttpServletRequest request, ResourcesNotExistException e){
        ModelAndView md = new ModelAndView("forward:/views/404.jsp");
        md.addObject("message",e.getMessage());
         return md;
     }
}
