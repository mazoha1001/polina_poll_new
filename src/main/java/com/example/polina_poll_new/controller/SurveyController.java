package com.example.polina_poll_new.controller;

import com.example.polina_poll_new.model.Answer;
import com.example.polina_poll_new.model.Question;
import com.example.polina_poll_new.model.SurveyResult;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class SurveyController {
    
    private static final String CORRECT_BOY_NAME = "Антон Мазоха";
    private static final String CORRECT_BOY_BIRTHDATE = "2002-01-30";

    private List<Question> getQuestions() {
        List<Question> questions = new ArrayList<>();
        
        questions.add(new Question(1, "Вы умеете жарить картошку?", List.of(
            new Answer(1, "Да, отлично", 3),
            new Answer(2, "Да, но не очень хорошо", 2),
            new Answer(3, "Нет, совсем не умею", 1),
            new Answer(4, "Учусь", 2)
        )));
        
        questions.add(new Question(2, "Вы считаете себя сучкой?", List.of(
            new Answer(1, "Да", 3),
            new Answer(2, "Нет", 1),
            new Answer(3, "Иногда", 2),
            new Answer(4, "Не знаю", 1)
        )));
        
        questions.add(new Question(3, "У вас есть септум?", List.of(
            new Answer(1, "Да", 3),
            new Answer(2, "Нет", 2),
            new Answer(3, "Планирую сделать", 2),
            new Answer(4, "Был(а), но снял(а)", 1)
        )));
        
        questions.add(new Question(4, "Вы глотаете сперму?", List.of(
            new Answer(1, "Да", 3),
            new Answer(2, "Нет", 1),
            new Answer(3, "Иногда", 2),
            new Answer(4, "Зависит от настроения", 2)
        )));
        
        questions.add(new Question(5, "Что для вас важнее: длина или обхват?", List.of(
            new Answer(1, "Длина", 2),
            new Answer(2, "Обхват", 3),
            new Answer(3, "Оба важны", 3),
            new Answer(4, "Не имеет значения", 1)
        )));
        
        questions.add(new Question(6, "На чем вы предпочли бы сидеть по ночам?", List.of(
            new Answer(1, "На стуле", 1),
            new Answer(2, "На наркотиках", 1),
            new Answer(3, "На лице парня", 3),
            new Answer(4, "На диване", 1)
        )));
        
        questions.add(new Question(7, "Выберите парня, который ближе к вашему типажу:", List.of(
            new Answer(1, "Джейсон Стетхем", 3),
            new Answer(2, "Киану Ривз", 1),
            new Answer(3, "Джаред Лето", 1),
            new Answer(4, "Джонни Депп", 1),
            new Answer(5, "Тимоти Шаломе", 1)
        )));
        
        questions.add(new Question(8, "Оцените уровень вашего либидо:", List.of(
            new Answer(1, "Низкое", 1),
            new Answer(2, "Среднее", 2),
            new Answer(3, "Высокое", 3),
            new Answer(4, "Очень высокое", 3)
        )));
        
        questions.add(new Question(9, "Выберите идеальный рост для вашего парня:", List.of(
            new Answer(1, "Выше 170 см", 1),
            new Answer(2, "187 см", 3),
            new Answer(3, "От 180 до 185 см", 2),
            new Answer(4, "Выше 190 см", 2)
        )));
        
        questions.add(new Question(10, "Выберите, как бы вы стали проводить совместный вечер:", List.of(
            new Answer(1, "Читать книжки", 1),
            new Answer(2, "Слушать демки парня", 3),
            new Answer(3, "Посмотреть фильм", 1),
            new Answer(4, "Уничтожить кровать жёстким сексом", 3)
        )));
        
        questions.add(new Question(11, "Ваша любовь напоминает мефедроновую манию?", List.of(
            new Answer(1, "Да", 3),
            new Answer(2, "Нет", 1),
            new Answer(3, "Не знаю что это", 1),
            new Answer(4, "Возможно", 2)
        )));
        
        questions.add(new Question(12, "Вы меркантильная?", List.of(
            new Answer(1, "Да", 1),
            new Answer(2, "Нет", 3),
            new Answer(3, "Иногда", 2),
            new Answer(4, "Зависит от ситуации", 2)
        )));
        
        questions.add(new Question(13, "Вы готовы сосать за сперму?", List.of(
            new Answer(1, "Да", 3),
            new Answer(2, "Нет", 1),
            new Answer(3, "Это моя мечта", 3),
            new Answer(4, "Возможно", 2)
        )));
        
        questions.add(new Question(14, "Что вас сильнее возбуждает?", List.of(
            new Answer(1, "Когда парень кусает мочки ушей", 2),
            new Answer(2, "Когда парень кусает вас в заднюю часть шеи", 3),
            new Answer(3, "Когда парень душит вас", 3),
            new Answer(4, "Когда парень сосёт ваши соски", 2),
            new Answer(5, "Когда парень применяет силу в вашу сторону", 3),
            new Answer(6, "Все варианты", 3)
        )));
        
        questions.add(new Question(15, "После прошлого вопроса насколько сильно у вас намокли трусики?", List.of(
            new Answer(1, "На 20%", 1),
            new Answer(2, "На 50%", 2),
            new Answer(3, "На 75%", 3),
            new Answer(4, "На 100%", 3)
        )));
        
        return questions;
    }
    
    @GetMapping("/")
    public String welcome() {
        return "welcome";
    }
    
    @PostMapping("/start")
    public String start(@RequestParam String girlName,
                       @RequestParam String girlBirthdate,
                       @RequestParam String boyName,
                       @RequestParam String boyBirthdate,
                       HttpSession session,
                       Model model) {
        
        if (!boyName.trim().equalsIgnoreCase(CORRECT_BOY_NAME)) {
            model.addAttribute("error", "Неверное имя парня!");
            model.addAttribute("suggestion", "Возможно, вы имели в виду \"" + CORRECT_BOY_NAME + "\"?");
            model.addAttribute("girlName", girlName);
            model.addAttribute("girlBirthdate", girlBirthdate);
            model.addAttribute("boyName", boyName);
            model.addAttribute("boyBirthdate", boyBirthdate);
            return "welcome";
        }
        
        if (!boyBirthdate.equals(CORRECT_BOY_BIRTHDATE)) {
            LocalDate correctDate = LocalDate.parse(CORRECT_BOY_BIRTHDATE);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
            String formattedDate = correctDate.format(formatter);
            
            model.addAttribute("error", "Неверная дата рождения парня!");
            model.addAttribute("suggestion", "Возможно, вы имели в виду: " + formattedDate);
            model.addAttribute("girlName", girlName);
            model.addAttribute("girlBirthdate", girlBirthdate);
            model.addAttribute("boyName", boyName);
            model.addAttribute("boyBirthdate", boyBirthdate);
            return "welcome";
        }
        
        session.setAttribute("girlName", girlName);
        session.setAttribute("boyName", boyName);
        session.setAttribute("girlBirthdate", girlBirthdate);
        session.setAttribute("boyBirthdate", boyBirthdate);
        
        return "redirect:/survey";
    }
    
    @GetMapping("/survey")
    public String survey(HttpSession session, Model model) {
        if (session.getAttribute("girlName") == null) {
            return "redirect:/";
        }
        
        model.addAttribute("questions", getQuestions());
        model.addAttribute("girlName", session.getAttribute("girlName"));
        model.addAttribute("boyName", session.getAttribute("boyName"));
        return "survey";
    }
    
    @PostMapping("/submit")
    public String submit(@RequestParam Map<String, String> answers, HttpSession session, Model model) {
        int totalPoints = 0;
        int maxPoints = 0;
        
        List<Question> questions = getQuestions();
        for (Question question : questions) {
            String answerIdStr = answers.get("question_" + question.getId());
            if (answerIdStr != null) {
                int answerId = Integer.parseInt(answerIdStr);
                for (Answer answer : question.getAnswers()) {
                    maxPoints = Math.max(maxPoints, answer.getPoints());
                    if (answer.getId() == answerId) {
                        totalPoints += answer.getPoints();
                        break;
                    }
                }
            }
        }
        
        maxPoints = maxPoints * questions.size();
        
        SurveyResult result = calculateResult(totalPoints, maxPoints);
        model.addAttribute("result", result);
        model.addAttribute("girlName", session.getAttribute("girlName"));
        model.addAttribute("boyName", session.getAttribute("boyName"));
        
        return "result";
    }
    
    private SurveyResult calculateResult(int totalPoints, int maxPoints) {
        SurveyResult result = new SurveyResult();
        result.setTotalPoints(maxPoints);
        result.setMaxPoints(maxPoints);
        result.setCompatibilityLevel("Идеальная совместимость");
        result.setDescription("Вы словно созданы друг для друга! Ваши характеры, интересы и жизненные ценности прекрасно дополняют друг друга.");
        result.setEmoji("💕");
        
        return result;
    }
}
