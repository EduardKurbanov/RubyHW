# Pin npm packages by running ./bin/importmap

pin "application", preload: true
#pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.3/dist/js/bootstrap.esm.js"
#pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"

#pin "bootstrap", to: "bootstrap.min.js", preload: true
#pin "@popperjs/core", to: "popper.js", preload: true

pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
