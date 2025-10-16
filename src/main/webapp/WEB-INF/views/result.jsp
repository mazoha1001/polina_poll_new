<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Результат теста на совместимость</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="result-container">
            <div class="result-header">
                <div class="emoji-large">${result.emoji}</div>
                <h1 class="result-title">${result.compatibilityLevel}</h1>
                <p class="couple-names">${girlName} ❤️ ${boyName}</p>
            </div>
            
            <div class="progress-section">
                <div class="progress-label">
                    <span>Уровень совместимости</span>
                    <span class="percentage">${result.percentage}%</span>
                </div>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: ${result.percentage}%"></div>
                </div>
            </div>
            
            <div class="result-photo">
                <img src="/images/photo.png" alt="Фото пары" class="couple-photo">
            </div>
            
            <div class="result-description">
                <p>${result.description}</p>
            </div>
            
            <div class="score-details">
                <div class="score-item">
                    <div class="score-value">${result.totalPoints}</div>
                    <div class="score-label">Ваши баллы</div>
                </div>
                <div class="score-divider">/</div>
                <div class="score-item">
                    <div class="score-value">${result.maxPoints}</div>
                    <div class="score-label">Максимум</div>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="/" class="button button-primary">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                    </svg>
                    <span>Пройти тест заново</span>
                </a>
                <button onclick="shareResult()" class="button button-secondary">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"/>
                    </svg>
                    <span>Поделиться</span>
                </button>
            </div>
        </div>
    </div>
    
    <script>
        function shareResult() {
            const text = `Я прошел(а) тест на совместимость! Мой результат: ${result.compatibilityLevel} (${result.percentage}%)`;
            
            if (navigator.share) {
                navigator.share({
                    title: 'Результат теста на совместимость',
                    text: text
                }).catch(err => console.log('Error sharing:', err));
            } else {
                navigator.clipboard.writeText(text).then(() => {
                    alert('Результат скопирован в буфер обмена!');
                });
            }
        }
        
        window.addEventListener('load', function() {
            const progressFill = document.querySelector('.progress-fill');
            const percentage = ${result.percentage};
            
            progressFill.style.width = '0%';
            
            setTimeout(() => {
                progressFill.style.transition = 'width 1.5s ease-out';
                progressFill.style.width = percentage + '%';
            }, 100);
        });
    </script>
</body>
</html>
