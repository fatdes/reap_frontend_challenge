.PHONY: test gen-api-model local

.DEFAULT_GOAL := test

test:
	flutter test --no-sound-null-safety

gen-api-model:
	flutter pub run build_runner build --delete-conflicting-outputs 

clean-gen-api-model:
	flutter pub run build_runner clean
	rm -rf ./generated_api

local:
	flutter run --no-sound-null-safety
