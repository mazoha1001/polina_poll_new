<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест на совместимость - Добро пожаловать</title>
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
            <h1 class="title">Добро пожаловать!</h1>
            <p class="subtitle">Узнайте уровень вашей совместимости</p>
        </div>
        
        <div class="welcome-description">
            <p>Этот тест поможет вам узнать, насколько вы подходите друг другу. Ответьте честно на несколько вопросов, и мы расскажем о вашей совместимости!</p>
        </div>
        
        <c:if test="${not empty error}">
            <div class="error-message">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"/>
                    <line x1="12" y1="8" x2="12" y2="12"/>
                    <line x1="12" y1="16" x2="12.01" y2="16"/>
                </svg>
                <div>
                    <strong>Ошибка!</strong>
                    <p>${error}</p>
                    <c:if test="${not empty suggestion}">
                        <p class="suggestion">${suggestion}</p>
                    </c:if>
                </div>
            </div>
        </c:if>
        
        <form action="/start" method="post" class="welcome-form">
            <div class="form-section">
                <h2 class="section-title">👩 Данные девушки</h2>
                
                <div class="form-group">
                    <label for="girlName" class="form-label">Имя девушки</label>
                    <input type="text" 
                           id="girlName" 
                           name="girlName" 
                           class="form-input"
                           placeholder="Введите имя"
                           value="${girlName}"
                           required>
                </div>
                
                <div class="form-group">
                    <label for="girlBirthdate" class="form-label">Дата рождения девушки</label>
                    <input type="date" 
                           id="girlBirthdate" 
                           name="girlBirthdate" 
                           class="form-input"
                           value="${girlBirthdate}"
                           required>
                </div>
            </div>
            
            <div class="form-section">
                <h2 class="section-title">👨 Данные парня</h2>
                
                <div class="form-group">
                    <label for="boyName" class="form-label">Имя парня</label>
                    <input type="text" 
                           id="boyName" 
                           name="boyName" 
                           class="form-input"
                           placeholder="Введите имя"
                           value="${boyName}"
                           required>
                </div>
                
                <div class="form-group">
                    <label for="boyBirthdate" class="form-label">Дата рождения парня</label>
                    <input type="date" 
                           id="boyBirthdate" 
                           name="boyBirthdate" 
                           class="form-input"
                           value="${boyBirthdate}"
                           required>
                </div>
            </div>
            
            <div class="submit-section">
                <button type="submit" class="submit-button">
                    <span>Начать тест</span>
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                </button>
            </div>
        </form>
    </div>
</body>
</html>
