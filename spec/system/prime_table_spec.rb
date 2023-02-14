require "rails_helper"

RSpec.feature "PrimeTable", type: :system do

  let(:dimension) { 3 }
  let(:dimension_1000) { 1000 }
  let(:dimension_100000) { 100000 }
  let(:per_page_dimension) { 15 }

  context "verify if root loads properly" do
    it "visit's the root url" do
      visit root_path

      expect(page).to have_field("dimension")
      expect(page).to have_button("Submit")
    end
  end

  scenario "User submits a valid side size" do
    visit root_path

    fill_in "Enter Dimension", with: dimension
    click_button "Submit"

    expect(page).to have_selector("th", count: dimension + 1)
    expect(page).to have_selector("td", count: dimension * dimension + dimension)
    expect(page).to have_button("Up", disabled: true)
    expect(page).to have_button("Down", disabled: true)
    expect(page).to have_button("Left", disabled: true)
    expect(page).to have_button("Right", disabled: true)

  end

  scenario "dimension set upto 1000" do
    visit root_path

    fill_in "Enter Dimension", with: dimension_1000
    click_button "Submit"

    expect(page).to have_selector("th", count: per_page_dimension + 1)
    expect(page).to have_selector("td", count: per_page_dimension * per_page_dimension + per_page_dimension)
    expect(page).to have_button("Up", disabled: true)
    expect(page).to have_button("Down")
    expect(page).to have_button("Left", disabled: true)
    expect(page).to have_button("Right")
  end

  scenario "dimension set upto 100000" do
    visit root_path

    fill_in "Enter Dimension", with: dimension_100000
    click_button "Submit"

    sleep 5

    expect(page).to have_selector("th", count: per_page_dimension + 1)
    expect(page).to have_selector("td", count: per_page_dimension * per_page_dimension + per_page_dimension)
    expect(page).to have_button("Up", disabled: true)
    expect(page).to have_button("Down")
    expect(page).to have_button("Left", disabled: true)
    expect(page).to have_button("Right")
  end

  scenario "testing front end pagination with 1000 primes" do
    visit root_path

    primes = Primes.n_primes(1000)

    fill_in "Enter Dimension", with: dimension_1000
    click_button "Submit"

    expect(page).to have_content(primes[14])
    expect(page).to have_no_content(primes[29])

    click_button "Down"

    expect(page).to have_content(primes[29])

    click_button "Up"

    expect(page).to have_no_content(primes[29])

    click_button "Right"

    expect(page).to have_content(primes[29])
  end
end