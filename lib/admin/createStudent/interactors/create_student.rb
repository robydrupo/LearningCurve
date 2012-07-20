require_relative "../models/student"

class CreateStudent
  attr_accessor :create_student_gateway

  def create_student(student_request)
    return MISSING_NAME_RESPONSE if(student_request["name"].nil?)
    return MISSING_BIRTH_DATE_RESPONSE if(student_request["birthDate"].nil?)
    return @create_student_gateway.create_student(create_student_model(student_request)) ? USER_CREATED_RESPONSE : GENERIC_FAILURE_RESPONSE
  end

  private

  def create_student_model(student_request)
    student = Student.new
    student.name = student_request["name"]
    student.birthDate = student_request["birthDate"]
    return student
  end

end

USER_CREATED_RESPONSE = Hash["studentCreated" => "OK"]
MISSING_NAME_RESPONSE = Hash["studentCreated" => "NO", "reason" => "Student name is required"]
MISSING_BIRTH_DATE_RESPONSE = Hash["studentCreated" => "NO", "reason" => "Birth date is required"]
GENERIC_FAILURE_RESPONSE = Hash["studentCreated" => "NO"]