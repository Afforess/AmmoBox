VERSION := 0.1.3

all:
	rm -rf build/
	mkdir build/
	mkdir build/AmmoBox_$(VERSION)
	cp -R LICENSE README.md data.lua data-updates.lua info.json control.lua prototypes libs locale graphics migrations build/AmmoBox_$(VERSION)
	cd build && zip -r AmmoBox_$(VERSION).zip AmmoBox_$(VERSION)
clean:
	rm -rf build/
