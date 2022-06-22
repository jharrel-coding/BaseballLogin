package com.jason.baseball.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "players")
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Min(value = 1, message = "The number must be greater than 1.")
    @Max(value = 99, message = "The number must be less than 99.")
    private int jerseyNumber;
    @NotBlank
    @Size(min= 3, max = 255, message = "Players first name must be more than three characters.")
    private String firstName;
    @NotBlank
    @Size(min= 3, max = 255, message = "Players last name must be more than three characters.")
    private String lastName;
    private String position;
    private boolean throwingHand;
    private boolean hittingHand;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "team_id")
    private Team team;

    public Team getTeam() {
        return team;
    }
    public void setTeam(Team team) {
        this.team = team;
    }

    //constructor
    public Player() {}

    public Player(int jerseyNumber, String firstName, String lastName, String position, boolean throwingHand, boolean hittingHand, Team team) {
        this.jerseyNumber = jerseyNumber;
        this.firstName = firstName;
        this.lastName = lastName;
        this.position = position;
        this.throwingHand = throwingHand;
        this.hittingHand = hittingHand;
        this.team = team;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getJerseyNumber() {
        return jerseyNumber;
    }

    public void setJerseyNumber(int jerseyNumber) {
        this.jerseyNumber = jerseyNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public boolean isThrowingHand() {
        return throwingHand;
    }

    public void setThrowingHand(boolean throwingHand) {
        this.throwingHand = throwingHand;
    }

    public boolean isHittingHand() {
        return hittingHand;
    }

    public void setHittingHand(boolean hittingHand) {
        this.hittingHand = hittingHand;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String fullName() {
        return String.format("%s %s", this.firstName, this.lastName);
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
