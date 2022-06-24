# Uncomment line below if you're using FVM (Flutter version management)
prefix := fvm

generate:
	$(prefix) flutter packages pub run build_runner build --delete-conflicting-outputs

watch:
	$(prefix) flutter packages pub run build_runner watch --delete-conflicting-outputs
	
clean:
	$(prefix) flutter clean
	$(prefix) flutter pub get
	$(prefix) flutter packages pub run build_runner build --delete-conflicting-outputs