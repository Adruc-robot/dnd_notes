# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

#this jquery link came from using ./bin/importmap pin jquery - this doesn't work
#pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js", preload: true
#this jquery link came from searching the interwebs
#pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"




#grapsing at straws to get foundation to work; based on the DHH youtube video: https://www.youtube.com/watch?v=PtxZvFnL2i0
#pin_all_from "app/javascript/testing", under: "testing"
pin_all_from "app/javascript/custom", under: "custom"
#rich_text approach to pull out trix and action text based upon DHH youtube video: https://www.youtube.com/watch?v=PtxZvFnL2i0
pin "rich_text"



#these links are from using ./bin/importmap pin foundation. However, SOMETHING about this breaks other stuff.  I don't know if it's my config or if the rails community doesn't use foundation or vice versa, so there's no support for any necessary updates, but see the testing pin below for the "fix"
#pin "foundation", to: "https://ga.jspm.io/npm:foundation@4.2.1-1/stylus/foundation.js"
#pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.16/nodelibs/browser/path.js"
#pin "stylus-type-utils", to: "https://ga.jspm.io/npm:stylus-type-utils@0.0.3/lib/type-utils.js"