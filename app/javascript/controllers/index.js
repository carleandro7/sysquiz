// Import and register all your controllers from the importmap via controllers/**/*_controller

import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import ProvaTempoController from "controllers/prova_tempo_controller.js"
application.register("prova-tempo", ProvaTempoController)
eagerLoadControllersFrom("controllers", application)
