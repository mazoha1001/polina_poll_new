package com.example.polina_poll_new.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SurveyResult {
    private int totalPoints;
    private int maxPoints;
    private String compatibilityLevel;
    private String description;
    private String emoji;
    
    public int getPercentage() {
        return maxPoints > 0 ? (totalPoints * 100) / maxPoints : 0;
    }
}
