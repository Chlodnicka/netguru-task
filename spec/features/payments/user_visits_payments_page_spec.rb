require 'spec_helper'

feature 'User visits payments page'  do
  let!(:student_1) { create :student, first_name: 'Jan', last_name: 'Kowalski' }
  let!(:payment_1) { create :payment, payment_date: Date.new, amount: 300.0, student_id: Student.take.id, status: "paid" }


  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see students and payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Kowalski'
    expect(page).to have_content '300.0'
    expect(page).to have_content 'paid'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end