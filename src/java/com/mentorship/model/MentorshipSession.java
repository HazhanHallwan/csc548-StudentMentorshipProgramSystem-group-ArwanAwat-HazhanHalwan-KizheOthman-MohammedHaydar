package com.mentorship.model;

import java.sql.Timestamp;

public class MentorshipSession {
    private int sessionId;
    private int matchId;
    private Timestamp sessionDate;
    private int durationMinutes;
    private String topic;
    private String locationType;
    private String locationDetails;
    private String status;
    private String notes;
    private Timestamp createdAt;

    // Constructors
    public MentorshipSession() {}

    // Getters and Setters
    public int getSessionId() { return sessionId; }
    public void setSessionId(int sessionId) { this.sessionId = sessionId; }

    public int getMatchId() { return matchId; }
    public void setMatchId(int matchId) { this.matchId = matchId; }

    public Timestamp getSessionDate() { return sessionDate; }
    public void setSessionDate(Timestamp sessionDate) { this.sessionDate = sessionDate; }

    public int getDurationMinutes() { return durationMinutes; }
    public void setDurationMinutes(int durationMinutes) { 
        this.durationMinutes = durationMinutes; 
    }

    public String getTopic() { return topic; }
    public void setTopic(String topic) { this.topic = topic; }

    public String getLocationType() { return locationType; }
    public void setLocationType(String locationType) { this.locationType = locationType; }

    public String getLocationDetails() { return locationDetails; }
    public void setLocationDetails(String locationDetails) { 
        this.locationDetails = locationDetails; 
    }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
