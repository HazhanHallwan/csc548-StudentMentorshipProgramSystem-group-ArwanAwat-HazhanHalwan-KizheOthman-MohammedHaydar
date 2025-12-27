package com.mentorship.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MentorshipMatch {
    private int matchId;
    private int studentId;
    private int mentorId;
    private String studentName;
    private String mentorName;
    private Date matchDate;
    private Date startDate;
    private Date expectedEndDate;
    private Date actualEndDate;
    private String status;
    private String goals;
    private Timestamp createdAt;

    // Constructors
    public MentorshipMatch() {}

    // Getters and Setters
    public int getMatchId() { return matchId; }
    public void setMatchId(int matchId) { this.matchId = matchId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getMentorId() { return mentorId; }
    public void setMentorId(int mentorId) { this.mentorId = mentorId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getMentorName() { return mentorName; }
    public void setMentorName(String mentorName) { this.mentorName = mentorName; }

    public Date getMatchDate() { return matchDate; }
    public void setMatchDate(Date matchDate) { this.matchDate = matchDate; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getExpectedEndDate() { return expectedEndDate; }
    public void setExpectedEndDate(Date expectedEndDate) { 
        this.expectedEndDate = expectedEndDate; 
    }

    public Date getActualEndDate() { return actualEndDate; }
    public void setActualEndDate(Date actualEndDate) { 
        this.actualEndDate = actualEndDate; 
    }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getGoals() { return goals; }
    public void setGoals(String goals) { this.goals = goals; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
