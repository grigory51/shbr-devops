package ru.yandex.shbr.java.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;


@RestController
public class EchoController {
    @RequestMapping("/*")
    public String index(HttpServletRequest request) throws UnsupportedEncodingException {
        String prefix = System.getenv("PREFIX");
        String path = request.getServletPath();
        String encoding = StandardCharsets.UTF_8.name();
        return (prefix != null ? prefix : "") + URLDecoder.decode(path.substring(1), encoding);
    }
}
