require "rspec"
require "../../../lib/admin/createStudent/interactors/create_student"

describe "The CreateStudent Interactor" do

  valid_student_request = Hash["name" => "Roberto Druetto", "birthDate" => "07/09/1982"]
  missing_name_student_request = Hash["birthDate" => "07/09/1982"]
  missing_birth_date_student_request = Hash["name" => "Roberto Druetto"]
  version = Hash["name" => "B-0003"]

  it "should create a student when valid data is passed on" do
    create_student_interactor = CreateStudent.new
    create_student_interactor.create_student_gateway = create_gateway_valid_user
    create_student_interactor.create_student(valid_student_request).should eq(USER_CREATED_RESPONSE)
  end

  it "B-0002"

  it "should not create a student when the name is missing" do
    create_student_interactor = CreateStudent.new
    create_student_interactor.create_student(missing_name_student_request).should eq(MISSING_NAME_RESPONSE)
  end

  it "should not create a student when the birth data is missing" do
    create_student_interactor = CreateStudent.new
    create_student_interactor.create_student(missing_birth_date_student_request).should eq(MISSING_BIRTH_DATE_RESPONSE)
  end

  it "should return a generic failure message when the user could not be created" do
    create_student_interactor = CreateStudent.new
    create_student_interactor.create_student_gateway = create_gateway_with_failure
    create_student_interactor.create_student(valid_student_request).should eq(GENERIC_FAILURE_RESPONSE)

  end

  it "B-0001"

  private

  def create_gateway_valid_user
    create_student_gateway = double('CreateStudentGateway')
    create_student_gateway.stub(:create_student).and_return(STUDENT_CREATED)
    return create_student_gateway
  end

  def create_gateway_with_failure
    create_student_gateway = double('CreateStudentGateway')
    create_student_gateway.stub(:create_student).and_return(STUDENT_NOT_CREATED)
    return create_student_gateway
  end

  STUDENT_CREATED = true
  STUDENT_NOT_CREATED = false

end