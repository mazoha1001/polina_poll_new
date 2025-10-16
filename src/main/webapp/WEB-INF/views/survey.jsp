<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест на совместимость</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="hearts-decoration">
                <span class="heart">💕</span>
                <span class="heart">❤️</span>
                <span class="heart">💗</span>
            </div>
            <h1 class="title">Тест на совместимость</h1>
            <p class="subtitle">${girlName} и ${boyName}, ответьте на вопросы</p>
        </div>
        
        <form action="/submit" method="post" class="survey-form" id="surveyForm">
            <c:forEach var="question" items="${questions}" varStatus="status">
                <div class="question-block" data-question="${status.index + 1}">
                    <div class="question-header">
                        <span class="question-number">Вопрос ${status.index + 1} из ${questions.size()}</span>
                        <h3 class="question-text">${question.text}</h3>
                    </div>
                    
                    <div class="answers-list">
                        <c:forEach var="answer" items="${question.answers}">
                            <label class="answer-option">
                                <input type="radio" 
                                       name="question_${question.id}" 
                                       value="${answer.id}" 
                                       required>
                                <span class="answer-text">${answer.text}</span>
                                <span class="checkmark"></span>
                            </label>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
            
            <div class="submit-section">
                <button type="submit" class="submit-button">
                    <span>Узнать результат</span>
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                </button>
            </div>
        </form>
    </div>
    
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <span class="modal-icon">⚠️</span>
            <p class="modal-message" id="modalMessage"></p>
            <button class="modal-button" onclick="closeModal()">Понятно</button>
        </div>
    </div>
    
    <script>
        const validationRules = {
            6: {
                correctAnswerId: 3,
                message: "Извините, этот ответ недоступен"
            },
            7: {
                correctAnswerId: 1,
                message: "Извините, у этого актёра неправильная причёска, попробуйте выбрать другого"
            },
            8: {
                correctAnswerIds: [3, 4],
                message: "Извините, этот уровень недостаточен для совместимости"
            },
            9: {
                correctAnswerId: 2,
                message: "Извините, этот рост не подходит для идеальной совместимости"
            },
            10: {
                correctAnswerIds: [2, 4],
                message: "Извините, этот вариант не подходит для идеального вечера"
            }
        };
        
        function showModal(message) {
            const modal = document.getElementById('errorModal');
            const modalMessage = document.getElementById('modalMessage');
            modalMessage.textContent = message;
            modal.style.display = 'flex';
        }
        
        function closeModal() {
            const modal = document.getElementById('errorModal');
            modal.style.display = 'none';
        }
        
        window.onclick = function(event) {
            const modal = document.getElementById('errorModal');
            if (event.target == modal) {
                closeModal();
            }
        }
        
        document.querySelectorAll('input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', function() {
                this.closest('.question-block').classList.remove('error');
                
                const questionBlock = this.closest('.question-block');
                const questionNumber = parseInt(questionBlock.dataset.question);
                const answerId = parseInt(this.value);
                
                if (validationRules[questionNumber]) {
                    const rule = validationRules[questionNumber];
                    let isValid = false;
                    
                    if (rule.correctAnswerId) {
                        isValid = answerId === rule.correctAnswerId;
                    } else if (rule.correctAnswerIds) {
                        isValid = rule.correctAnswerIds.includes(answerId);
                    }
                    
                    if (!isValid) {
                        setTimeout(() => {
                            this.checked = false;
                            showModal(rule.message);
                        }, 100);
                    }
                }
            });
        });
        
        document.getElementById('surveyForm').addEventListener('submit', function(e) {
            const questions = document.querySelectorAll('.question-block');
            let allAnswered = true;
            
            questions.forEach(question => {
                const radios = question.querySelectorAll('input[type="radio"]');
                const answered = Array.from(radios).some(radio => radio.checked);
                
                if (!answered) {
                    allAnswered = false;
                    question.classList.add('error');
                } else {
                    question.classList.remove('error');
                }
            });
            
            if (!allAnswered) {
                e.preventDefault();
                alert('Пожалуйста, ответьте на все вопросы!');
            }
        });
    </script>
</body>
</html>
