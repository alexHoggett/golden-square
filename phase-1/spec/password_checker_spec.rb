require 'password_checker'

describe "PasswordChecker class" do
  it "fails when password is invalid" do
    passwordChecker = PasswordChecker.new()
    expect { passwordChecker.check('test') }.to raise_error "Invalid password, must be 8+ characters."
  end

  it "returns true when password is long enough" do
    passwordChecker = PasswordChecker.new()
    expect(passwordChecker.check("alongpassword")).to eq true
  end
end