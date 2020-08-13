project('Vala Calculator', 'vala', 'c')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
]

sources = files('vala-calculator.vala')

#hello_lib = shared_library('calculator', 'vala-calculator.vala',
#                  vala_header: 'calculator.h',
#                  vala_vapi: 'calculator-1.0.vapi',
#                  dependencies: dependencies,
#                  install: true,
#                  install_dir: [true, true, true])

executable('calculator', sources, dependencies: dependencies, install: true)
