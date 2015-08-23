all:
	rm -rf build/
	mkdir build/
	mkdir build/AmmoBox_0.1.0
	cp -R LICENSE README.md data.lua info.json control.lua prototypes libs locale graphics migrations build/AmmoBox_0.1.0
	cd build && zip -r AmmoBox_0.1.0.zip AmmoBox_0.1.0
clean:
	rm -rf build/
