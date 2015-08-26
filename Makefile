all:
	rm -rf build/
	mkdir build/
	mkdir build/AmmoBox_0.1.2
	cp -R LICENSE README.md data.lua data-updates.lua info.json control.lua prototypes libs locale graphics migrations build/AmmoBox_0.1.2
	cd build && zip -r AmmoBox_0.1.2.zip AmmoBox_0.1.2
clean:
	rm -rf build/
