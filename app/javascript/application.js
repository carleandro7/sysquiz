// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "cocoon-js"
import $ from "jquery";
window.$ = $;
window.jQuery = $;
import * as ActiveStorage from "@rails/activestorage"


ActiveStorage.start()
