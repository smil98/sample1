package com.example.sample1.controller;

import com.example.sample1.dao.TodoDao;
import com.example.sample1.domain.Todo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class TodoController {
    private TodoDao todoDao;

    public TodoController() {
        todoDao = new TodoDao();
    }

    @GetMapping("/")
    public void home(Model model) {
        //reads todos and puts in model
        List<Todo> list = todoDao.list();
        model.addAttribute("todoList", list);
    }

    @PostMapping("/add")
    public String add(Todo todo, RedirectAttributes rttr) {
        //add new todo

        todoDao.insert(todo);
        //put result in model
        //redirect to home
        return "redirect:/";
    }
}
