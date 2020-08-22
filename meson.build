project('Vala Calculator', 'vala', 'c', version: '0.1.1')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
    meson.get_compiler('c').find_library('m', required: false),
]

sources = files('vala-calculator.vala')
if meson.is_cross_build()
    winmod = import('windows')
    sources += winmod.compile_resources('calc.rc')
endif

calculator_lib = shared_library(
  'calculator',
  'vala-calculator.vala',
  vala_header: 'calculator.h',
  vala_vapi: 'calculator-1.0.vapi',
  dependencies: dependencies,
  install: true,
  install_dir: [true, true, true]
)

executable(
  'calculator',
  sources,
  dependencies : dependencies,
  gui_app : true,
  install : true
)

