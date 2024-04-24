module ini


#flag -I @VMODROOT/thirdparty/ini
#flag @VMODROOT/thirdparty/ini-lib.o


pub const global_section = 0
pub const not_found = -1

struct C.ini_t {}
pub type Ini_t = C.ini_t

fn C.ini_create(memctx voidptr) &C.ini_t
@[inline]
pub fn create(memctx voidptr) &C.ini_t {
	return C.ini_create(memctx)
}

fn C.ini_load(data &char, memctx voidptr) &C.ini_t
@[inline]
pub fn load(data &char, memctx voidptr) &C.ini_t {
	return C.ini_load(data, memctx)
}

fn C.ini_save(ini &C.ini_t, data &char, size int) int
@[inline]
pub fn save(ini_data &C.ini_t, data &char, size int) int {
	return C.ini_save(ini_data, data, size)
}

fn C.ini_destroy(ini &C.ini_t)
@[inline]
pub fn destroy(ini_data &C.ini_t) {
	C.ini_destroy(ini_data)
}

fn C.ini_section_count(ini &C.ini_t) int
@[inline]
pub fn section_count(ini_data &C.ini_t) int {
	return C.ini_section_count(ini_data)
}

fn C.ini_section_name(ini &C.ini_t, section int) &char
@[inline]
pub fn section_name(ini_data &C.ini_t, section int) &char {
	return C.ini_section_name(ini_data, section)
}

fn C.ini_property_count(ini &C.ini_t, section int) int
@[inline]
pub fn property_count(ini_data &C.ini_t, section int) int {
	return C.ini_property_count(ini_data, section)
}

fn C.ini_property_name(ini &C.ini_t, section int, property int) &char
@[inline]
pub fn property_name(ini_data &C.ini_t, section int, property int) &char {
	return C.ini_property_name(ini_data, section, property)
}

fn C.ini_property_value(ini &C.ini_t, section int, property int) &char
@[inline]
pub fn property_value(ini_data &C.ini_t, section int, property int) &char {
	return C.ini_property_value(ini_data, section, property)
}

fn C.ini_find_section(ini &C.ini_t, name &char, name_length int) int
@[inline]
pub fn find_section(ini_data &C.ini_t, name &char, name_length int) int {
	return C.ini_find_section(ini_data, name, name_length)
}

fn C.ini_find_property(ini &C.ini_t, section int, name &char, name_length int) int
@[inline]
pub fn find_property(ini_data &C.ini_t, section int, name &char, name_length int) int {
	return C.ini_find_property(ini_data, section, name, name_length)
}

fn C.ini_section_add(ini &C.ini_t, name &char, length int) int
@[inline]
pub fn section_add(ini_data &C.ini_t, name &char, length int) int {
	return C.ini_section_add(ini_data, name, length)
}

fn C.ini_property_add(ini &C.ini_t, section int, name &char, name_length int, value &char, value_length int)
@[inline]
pub fn property_add(ini_data &C.ini_t, section int, name &char, name_length int, value &char, value_length int) {
	C.ini_property_add(ini_data, section, name, name_length, value, value_length)
}

fn C.ini_section_remove(ini &C.ini_t, section int) 
@[inline]
pub fn section_remove(ini_data &C.ini_t, section int) {
	C.ini_section_remove(ini_data, section)
}

fn C.ini_property_remove(ini &C.ini_t, section int, property int) 
@[inline]
pub fn property_remove(ini_data &C.ini_t, section int, property int) {
	C.ini_property_remove(ini_data, section, property)
}

fn C.ini_section_name_set(ini &C.ini_t, section int, name &char, length int) 
@[inline]
pub fn section_name_set(ini_data &C.ini_t, section int, name &char, length int) {
	C.ini_section_name_set(ini_data, section, name, length)
}

fn C.ini_property_name_set(ini &C.ini_t, section int, property int, name &char, length int) 
@[inline]
pub fn property_name_set(ini_data &C.ini_t, section int, property int, name &char, length int) {
	C.ini_property_name_set(ini_data, section, property, name, length)
}

fn C.ini_property_value_set(ini &C.ini_t, section int, property int, value &char, length int) 
@[inline]
pub fn property_value_set(ini_data &C.ini_t, section int, property int, value &char, length int) {
	C.ini_property_value_set(ini_data, section, property, value, length)
}
