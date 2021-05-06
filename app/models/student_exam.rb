class StudentExam < ActiveRecord::Base 
    belongs_to :exam 
    belongs_to :student 

    def print_details
        puts "#{self.student.name} took the #{self.exam.subject} receiving a score of #{self.grade}"
    end

    def questions_correct_ratio
        "#{((self.grade * self.exam.total_questions) / 100).to_i} questions correct out of #{self.exam.total_questions} questions total"
    end
end 