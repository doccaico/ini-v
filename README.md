## INI
INI module for V. It uses the [ini.h](https://github.com/mattiasgustavsson/libs/) library for parsing INI files.

### Installation
```
$ v install --git https://github.com/doccaico/ini-v
```

### Loading an ini file and retrieving values
```v
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
```
### Create a ini file
```v
module main

import os
import doccaico.ini

fn main() {
	ini_data := ini.create(unsafe { nil })
	defer {
		ini.destroy(ini_data)
	}

	ini.property_add(ini_data, ini.global_section, 'Version'.str, 0, '11.2401.26.0'.str,
		0)
	ini.property_add(ini_data, ini.global_section, 'NoTrayIcon'.str, 0, '0'.str, 0)
	ini.property_add(ini_data, ini.global_section, 'Editor'.str, 0, 'c:/WINDOWS/system32/notepad.exe'.str,
		0)

	normal_section := ini.section_add(ini_data, 'Normal'.str, 0)
	ini.property_add(ini_data, normal_section, 'Version'.str, 0, '9.1'.str, 0)
	ini.property_add(ini_data, normal_section, 'NoTrayIcon'.str, 0, '5'.str, 0)
	ini.property_add(ini_data, normal_section, 'Editor'.str, 0, 'c:/editor/vim.exe'.str,
		0)

	needed_size := ini.save(ini_data, unsafe { nil }, 0) // Find the size needed
	data := unsafe { malloc(needed_size) }
	defer {
		unsafe { free(data) }
	}
	_ := ini.save(ini_data, data, needed_size) // Actually save the file

	unsafe {
		println('${cstring_to_vstring(data)}')
	}
	// Version=11.2401.26.0
	// NoTrayIcon=0
	// Editor=c:/WINDOWS/system32/notepad.exe
	//
	// [Normal]
	// Version=9.1
	// NoTrayIcon=5
	// Editor=c:/editor/vim.exe

	os.write_file('new.ini', unsafe { cstring_to_vstring(data) })!
}
```
