class Exam < ActiveRecord::Base
    has_many :student_exams
    has_many :students, through: :student_exams

    def insert_feedback(student, grade, comment)
        se = StudentExam.create(teacher_comment: comment, grade: grade, exam_id: self.id, student_id: student.id)
        self.student_exams << se 
        student.student_exams << se 
        se 
    end

    def class_average
        self.student_exams.average("grade")
    end

    def self.used_exams
        self.all.filter{ |exam| exam.student_exams.count > 0 }
    end

    def self.lowest_average
        self.all.min_by{ |exam| exam.class_average}
    end 

    def self.drop_lowest_average
        self.lowest_average.destroy.student_exams.each{|student_exam| student_exam.destroy}
    end 
end
