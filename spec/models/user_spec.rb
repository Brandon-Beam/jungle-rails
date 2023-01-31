require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates existence" do
      @user=User.new({
        name:  "tree",
        email: "bbeam1@gmail.com",
        password_confirmation: "1234567891",
        password_digest: "1234567891"
      })
     
     expect(@user.save).to be(true)
    end
    it "validates passwords same" do
      @user=User.new({
        name:  "tree",
        email: "bbeam1@gmail.com",
        password_confirmation: "1234567891",
        password_digest: "1234567891"
      })
     
     expect(@user.password_digest).to eq(@user.password_confirmation)
    end
    it "validates name" do
      @user=User.new({
        name:  nil,
        email: "bbeam1@gmail.com",
        password_confirmation: "1234567891",
        password_digest: "1234567891"
      })
      @user.save
     expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "validates name" do
      @user=User.new({
        name:  "brandon",
        email: "bbeam1@gmail.com",
        password_confirmation: "1234567891",
        password_digest: "1234567891"
      })
      @user2=User.new({
        name:  "brandon",
        email: "Bbeam1@gmail.com",
        password_confirmation: "1234567891",
        password_digest: "1234567891"
      })
      @user.save
      @user2.save
     expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
  describe '.authenticate_with_credentials' do
    it "validates both email and password" do
    @user=User.new({
      name:  "brandon",
      email: "bbeam1@gmail.com",
      password_confirmation: "1234567891",
      password_digest: "1234567891"
    })
@user.save
    puts @user.authenticate_with_credentials(@user.email, @user.password_digest)
    expect(@user.authenticate_with_credentials(@user.email, @user.password_digest)).to be(@user)
   end
  end
end