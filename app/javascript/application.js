import Rails from "rails-ujs"
Rails.start()
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "cocoon"
import $ from "jquery"
window.jQuery = $
import * as ActiveStorage from "@rails/activestorage"
import "rails-ujs"


ActiveStorage.start()
Rails.start()
