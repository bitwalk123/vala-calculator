project('Vala Calculator', 'vala', 'c', version: '0.1')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
]

sources = files('vala-calculator.vala')

calculator_lib = shared_library(
  'calculator',
  'vala-calculator.vala',
  vala_header: 'calculator.h',
  vala_vapi: 'calculator-1.0.vapi',
  dependencies: dependencies,
  link_args : ['-X', '-lm',],
  install: true,
  install_dir: [true, true, true]
)

executable(
  'calculator',
  sources,
  dependencies : dependencies,
  link_args : ['-X', '-lm',],
  install : true
)

