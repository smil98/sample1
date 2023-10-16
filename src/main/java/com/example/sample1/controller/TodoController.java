package com.example.sample1.controller;

import com.example.sample1.dao.TodoDao;
import com.example.sample1.domain.Todo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.List;

@Controller
public class TodoController {

    @Autowired
    private TodoDao todoDao;

    @GetMapping("/")
    public String home(Model model) throws Exception {
        //reads todos and puts in model
        List<Todo> list = todoDao.list();
        model.addAttribute("todoList", list);

        return "home";
    }

    @PostMapping("/add")
    public String add(Todo todo, RedirectAttributes rttr) throws SQLException {
        //add new todo
        boolean result = todoDao.insert(todo);
        //put result in model
        //redirect to home
        return "redirect:/";
    }
}
