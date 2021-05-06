class Student < ActiveRecord::Base
    has_many :student_exams
    has_many :exams, through: :student_exams

    def self.upper_classmen
        self.all.where("year > 2")
    end

    def self.under_classmen
        self.all.where("year < 3")
    end

    def self.subject_matter_experts(subject)
        self.all.where("degree = #{subject}")
    end

    def self.exam_taker_professional
        self.all.max_by{ |student| student.student_exams.count }
    end

    def overall_average
        self.student_exams.average("grade")
    end

    def self.rising_star
        self.all.filter{|student| student.overall_average}.max_by{ |student| student.overall_average }
    end

    def self.valedictorian
        self.all.where("year = 4").filter{|student| student.overall_average}.max_by{ |student| student.overall_average }
    end
end
