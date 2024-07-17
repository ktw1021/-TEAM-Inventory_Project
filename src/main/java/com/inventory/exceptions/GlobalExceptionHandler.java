package com.inventory.exceptions;

import java.sql.SQLIntegrityConstraintViolationException;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final String DUPLICATE_KEY_ERROR_MSG = "중복된 키가 데이터베이스에 존재합니다.";

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseStatus(HttpStatus.CONFLICT) // 409 Conflict
    public ModelAndView handleDuplicateKeyException(DuplicateKeyException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", DUPLICATE_KEY_ERROR_MSG);
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    @ResponseStatus(HttpStatus.CONFLICT) // 409 Conflict
    public ModelAndView handleSQLIntegrityConstraintViolationException(SQLIntegrityConstraintViolationException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", "데이터베이스 무결성 제약 조건에 위배됩니다.");
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    @ExceptionHandler(NullPointerException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleNullPointerException(NullPointerException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", "NullPointerException이 발생했습니다.");
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ModelAndView handleIllegalArgumentException(IllegalArgumentException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", "잘못된 인자가 전달되었습니다.");
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    @ExceptionHandler(NumberFormatException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ModelAndView handleNumberFormatException(NumberFormatException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", "잘못된 숫자 형식입니다.");
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    @ExceptionHandler(ArrayIndexOutOfBoundsException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleArrayIndexOutOfBoundsException(ArrayIndexOutOfBoundsException ex) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("errorMessage", "배열 인덱스가 범위를 벗어났습니다.");
        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
        return modelAndView;
    }

    // 다른 예외 핸들러들은 여기에 추가할 수 있습니다.

//    @ExceptionHandler(Exception.class)
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    public ModelAndView handleAllExceptions(Exception ex) {
//        ModelAndView modelAndView = new ModelAndView("errorPage");
//        modelAndView.addObject("errorMessage", "서버에서 오류가 발생했습니다.");
//        modelAndView.addObject("exception", ex); // 예외 객체를 추가하여 JSP에서 접근할 수 있도록 합니다.
//        return modelAndView;
//    }
}
