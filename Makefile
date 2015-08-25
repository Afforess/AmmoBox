all:
	rm -rf build/
	mkdir build/
	mkdir build/AmmoBox_0.1.1
	cp -R LICENSE README.md data.lua data-updates.lua info.json control.lua prototypes libs locale graphics migrations build/AmmoBox_0.1.1
	cd build && zip -r AmmoBox_0.1.1.zip AmmoBox_0.1.1
clean:
	rm -rf build/
