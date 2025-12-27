package com.mentorship.model;

public class Mentor {
    private int mentorId;
    private int userId;
    private String mentorNumber;
    private String fullName;
    private String email;
    private String phone;
    private String department;
    private String positionTitle;
    private String expertiseAreas;
    private int yearsExperience;
    private int maxMentees;
    private int currentMenteesCount;
    private String bio;

    // Constructors
    public Mentor() {}

    // Getters and Setters
    public int getMentorId() { return mentorId; }
    public void setMentorId(int mentorId) { this.mentorId = mentorId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getMentorNumber() { return mentorNumber; }
    public void setMentorNumber(String mentorNumber) { this.mentorNumber = mentorNumber; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getPositionTitle() { return positionTitle; }
    public void setPositionTitle(String positionTitle) { this.positionTitle = positionTitle; }

    public String getExpertiseAreas() { return expertiseAreas; }
    public void setExpertiseAreas(String expertiseAreas) { 
        this.expertiseAreas = expertiseAreas; 
    }

    public int getYearsExperience() { return yearsExperience; }
    public void setYearsExperience(int yearsExperience) { 
        this.yearsExperience = yearsExperience; 
    }

    public int getMaxMentees() { return maxMentees; }
    public void setMaxMentees(int maxMentees) { this.maxMentees = maxMentees; }

    public int getCurrentMenteesCount() { return currentMenteesCount; }
    public void setCurrentMenteesCount(int currentMenteesCount) { 
        this.currentMenteesCount = currentMenteesCount; 
    }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }
}
