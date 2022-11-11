# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe 'Navegation', type: :feature do

    before(:each) do
        movie_1 = Movie.create(title: 'si-ES-Regional', age_restriction: 'si', language: 'ES')
        MovieTime.create(room: 1, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'NOCHE',
                        place: 'Regional', movie_id: movie_1.id)
                        
        movie_2 = Movie.create(title: 'no-ES-Regional', age_restriction: 'no', language: 'ES')
        MovieTime.create(room: 2, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'NOCHE',
                        place: 'Regional', movie_id: movie_2.id)

        movie_3 = Movie.create(title: 'si-EN-Regional', age_restriction: 'si', language: 'EN')
        MovieTime.create(room: 3, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'NOCHE',
                        place: 'Regional', movie_id: movie_3.id)
                        
        movie_4 = Movie.create(title: 'no-EN-Regional', age_restriction: 'no', language: 'EN')
        MovieTime.create(room: 4, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'NOCHE',
                        place: 'Regional', movie_id: movie_4.id)

        movie_5 = Movie.create(title: 'si-ES-Santiago', age_restriction: 'si', language: 'ES')
        MovieTime.create(room: 5, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'TANDA',
                        place: 'Santiago', movie_id: movie_5.id)

        movie_6 = Movie.create(title: 'no-ES-Santiago', age_restriction: 'no', language: 'ES')
        MovieTime.create(room: 6, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'TANDA',
                        place: 'Santiago', movie_id: movie_6.id)

        movie_7 = Movie.create(title: 'si-EN-Santiago', age_restriction: 'si', language: 'EN')
        MovieTime.create(room: 7, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'TANDA',
                        place: 'Santiago', movie_id: movie_7.id)

        movie_8 = Movie.create(title: 'no-EN-Santiago', age_restriction: 'no', language: 'EN')
        MovieTime.create(room: 8, date_start: Date.new(2030, 10, 10),
                        date_end: Date.new(2030, 12, 12), time: 'TANDA',
                        place: 'Santiago', movie_id: movie_8.id)
    end


    scenario 'R1' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '20'
        select 'Regional', from: 'sucursal'
        select 'Español', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_content('si-ES-Regional'))
        expect(page).to(have_content('no-ES-Regional'))
        expect(page).to(have_content('si-EN-Regional'))
        expect(page).to(have_content('no-EN-Regional'))
        # check filter
        expect(page.body).not_to(match(/-Santiago</m))
        # check order
        expect(page.body).not_to(match(/-EN-.*-ES-/m))
    end

    scenario 'R2' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '15'
        select 'Regional', from: 'sucursal'
        select 'Español', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_no_content('si-ES-Regional'))
        expect(page).to(have_content('no-ES-Regional'))
        expect(page).to(have_no_content('si-EN-Regional'))
        expect(page).to(have_content('no-EN-Regional'))
        # check filter
        expect(page.body).not_to(match(/-Santiago</m))
        # check order
        expect(page.body).not_to(match(/-EN-.*-ES-/m))
    end

    scenario 'R3' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '20'
        select 'Regional', from: 'sucursal'
        select 'Inglés', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_content('si-ES-Regional'))
        expect(page).to(have_content('no-ES-Regional'))
        expect(page).to(have_content('si-EN-Regional'))
        expect(page).to(have_content('no-EN-Regional'))
        # check filter
        expect(page.body).not_to(match(/-Santiago</m))
        # check order
        expect(page.body).not_to(match(/-ES-.*-EN-/m))
    end   

    scenario 'R4' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '15'
        select 'Regional', from: 'sucursal'
        select 'Inglés', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_no_content('si-ES-Regional'))
        expect(page).to(have_content('no-ES-Regional'))
        expect(page).to(have_no_content('si-EN-Regional'))
        expect(page).to(have_content('no-EN-Regional'))
        # check filter
        expect(page.body).not_to(match(/-Santiago</m))
        # check order
        expect(page.body).not_to(match(/-ES-.*-EN-/m))
    end

    scenario 'R5' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '20'
        select 'Santiago', from: 'sucursal'
        select 'Español', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_content('si-ES-Santiago'))
        expect(page).to(have_content('no-ES-Santiago'))
        expect(page).to(have_content('si-EN-Santiago'))
        expect(page).to(have_content('no-EN-Santiago'))
        # check filter
        expect(page.body).not_to(match(/-Regional</m))
        # check order
        expect(page.body).not_to(match(/-EN-.*-ES-/m))
    end

    scenario 'R6' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '17'
        select 'Santiago', from: 'sucursal'
        select 'Español', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_no_content('si-ES-Santiago'))
        expect(page).to(have_content('no-ES-Santiago'))
        expect(page).to(have_no_content('si-EN-Santiago'))
        expect(page).to(have_content('no-EN-Santiago'))
        # check filter
        expect(page.body).not_to(match(/-Regional</m))
        # check order
        expect(page.body).not_to(match(/-EN-.*-ES-/m))
    end

    scenario 'R7' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '18'
        select 'Santiago', from: 'sucursal'
        select 'Inglés', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_content('si-ES-Santiago'))
        expect(page).to(have_content('no-ES-Santiago'))
        expect(page).to(have_content('si-EN-Santiago'))
        expect(page).to(have_content('no-EN-Santiago'))
        # check filter
        expect(page.body).not_to(match(/-Regional</m))
        # check order
        expect(page.body).not_to(match(/-ES-.*-EN-/m))
    end

    scenario 'R8' do
        visit '/'
        fill_in 'date', with: '2030-11-11'
        fill_in 'age', with: '17'
        select 'Santiago', from: 'sucursal'
        select 'Inglés', from: 'language'
        click_button 'commit'
        #check content
        expect(page).to(have_no_content('si-ES-Santiago'))
        expect(page).to(have_content('no-ES-Santiago'))
        expect(page).to(have_no_content('si-EN-Santiago'))
        expect(page).to(have_content('no-EN-Santiago'))
        # check filter
        expect(page.body).not_to(match(/-Regional</m))
        # check order
        expect(page.body).not_to(match(/-ES-.*-EN-/m))
    end
end