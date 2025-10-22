package com.coursemanagement.model;

public class ManageCourse {
	
	private int c_id;
	private String imagePath;
	private String title;
	private String description;
	private String duration;
	
	public ManageCourse() {
		
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "ManageCourse [c_id=" + c_id + ", imagePath=" + imagePath + ", title=" + title + ", description="
				+ description + ", duration=" + duration + "]";
	}
}
