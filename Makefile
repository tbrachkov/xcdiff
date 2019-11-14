VERSION_MAJOR = 0
VERSION_MINOR = 2
VERSION_PATCH = 0
VERSION = $(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)
GIT_SHORT_HASH = $(shell git rev-parse --short HEAD)

clean:
	xcrun swift package clean

install: build
	mkdir -p $(PREFIX)/bin
	mkdir -p $(PREFIX)/lib/xcdiff
	cp -f $(BUILD_PATH) $(INSTALL_PATH)
	cp -f $(SWIFT_LIB_FILES) $(LIB_INSTALL_PATH)

build:
	swift package clean
	swift build --disable-sandbox -c release --static-swift-stdlib

test:
	xcrun swift test

update_version:
	sed -i '' 's/\(Version(\)\(.*\)\(, \)/\1$(VERSION_MAJOR), $(VERSION_MINOR), $(VERSION_PATCH)\3/' Sources/XCDiffCommand/Constants.swift
	sed -i '' 's/upToNextMinor(from: ".*")/upToNextMinor(from: "${VERSION}")/' Documentation/Installation.md
	sed -i '' 's/output, ".*debug.local/output, "${VERSION}+debug.local/' Tests/XCDiffCommandTests/CommandsRunnerTests.swift

update_hash:
	sed -i '' 's/#GIT_SHORT_HASH#/$(GIT_SHORT_HASH)/' Sources/XCDiffCommand/Constants.swift

format:
	swiftformat .

autocorrect:
	swiftlint autocorrect --quiet

lint:
	swiftlint version
	swiftformat --version
	swiftlint --strict --quiet
	swiftformat . --lint
