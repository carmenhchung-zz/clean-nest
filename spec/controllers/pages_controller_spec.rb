require 'rails_helper'

RSpec.describe PagesController, type: :controller do

# Test to see if action search in pages controller provides successful response

  describe "GET search" do

      it "returns a 200 OK status" do
        get :search
        expect(response.status).to eq(200)
      end

      context "when location param and date param are not provided" do
        it "assigns all active users to @user_location" do
          user = User.create! username: 'ironingman', active: true, firstname: "Tommy", lastname: "Stark", email: "stark@stark.com", password: 'password'
          get :search
          expect(assigns(:user_location)).to eq([user])
        end
      end

      context "when location param is provided but date param is not provided" do
        it "assigns all active users to @user_location" do
          user = User.create! username: 'ironingman', active: true, firstname: "Tommy", lastname: "Stark", email: "stark@stark.com", password: 'password'
          get :search, {:searc => {:addres => '1 Blah Street'}}
          expect(assigns(:user_location)).to eq([user])
        end
      end


    end

  end
