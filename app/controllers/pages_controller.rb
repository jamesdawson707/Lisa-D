class PagesController < ApplicationController
    def home
        @meta_title = meta_title 'Home'
        @meta_description = 'Australian and International Fashion'
    end
    
    def gallery
        @meta_title = meta_title 'Gallery'
        @meta_description = 'Our Instagram feed'
    end
    
    def brands
        @meta_title = meta_title 'Brands'
        @meta_description = 'Some of our favourite brands in store'
    end
end