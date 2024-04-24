module main

import os
import doccaico.ini

fn main() {
	bytes := os.read_file('test.ini')!

	ini_data := ini.load(bytes.str, unsafe { nil })
	defer {
		ini.destroy(ini_data)
	}

	// global
	global_version_index := ini.find_property(ini_data, ini.global_section, 'Version'.str,
		0)
	global_version := ini.property_value(ini_data, ini.global_section, global_version_index)

	unsafe {
		println('Version=${cstring_to_vstring(global_version)}')
	}

	// normal section
	normal_section := ini.find_section(ini_data, 'Normal'.str, 0)
	normal_editor_index := ini.find_property(ini_data, normal_section, 'Editor'.str, 0)
	normal_editor := ini.property_value(ini_data, normal_section, normal_editor_index)

	unsafe {
		println('Editor=${cstring_to_vstring(normal_editor)}')
	}
	// Version=11.2401.26.0
	// Editor=c:/editor/vim.exe
}
