# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_05_224830) do

  create_table "exams", force: :cascade do |t|
    t.string "subject"
    t.integer "total_questions"
    t.boolean "is_pop_quiz"
    t.date "administration_date"
  end

  create_table "student_exams", force: :cascade do |t|
    t.string "teacher_comment"
    t.integer "grade"
    t.integer "exam_id"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "degree"
    t.date "birthday"
    t.integer "year"
  end

end
