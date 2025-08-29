#!/bin/bash

# iB-theme Test Script
# Tests theme files for validity and completeness
# Usage: ./test-themes.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Function to print test results
print_test() {
    local status=$1
    local message=$2
    TESTS_RUN=$((TESTS_RUN + 1))
    
    if [ "$status" = "PASS" ]; then
        echo -e "${GREEN}✓ PASS${NC}: $message"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗ FAIL${NC}: $message"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
}

print_info() {
    echo -e "${BLUE}ℹ INFO${NC}: $1"
}

print_warning() {
    echo -e "${YELLOW}⚠ WARN${NC}: $1"
}

echo -e "${BLUE}🧪 iB-theme Test Suite${NC}"
echo -e "${BLUE}=====================${NC}"
echo ""

# Test 1: Check if required files exist
print_info "Testing file existence..."

if [ -f "package.json" ]; then
    print_test "PASS" "package.json exists"
else
    print_test "FAIL" "package.json missing"
fi

if [ -f "themes/ib-theme-dark.json" ]; then
    print_test "PASS" "Dark theme JSON exists"
else
    print_test "FAIL" "Dark theme JSON missing"
fi

if [ -f "themes/ib-theme-light.json" ]; then
    print_test "PASS" "Light theme JSON exists"
else
    print_test "FAIL" "Light theme JSON missing"
fi

if [ -f "emacs/ib-theme-dark-theme.el" ]; then
    print_test "PASS" "Emacs dark theme exists"
else
    print_test "FAIL" "Emacs dark theme missing"
fi

if [ -f "emacs/ib-theme-light-theme.el" ]; then
    print_test "PASS" "Emacs light theme exists"
else
    print_test "FAIL" "Emacs light theme missing"
fi

if [ -f "vim/colors/ib-theme-dark.vim" ]; then
    print_test "PASS" "VIM dark theme exists"
else
    print_test "FAIL" "VIM dark theme missing"
fi

if [ -f "vim/colors/ib-theme-light.vim" ]; then
    print_test "PASS" "VIM light theme exists"
else
    print_test "FAIL" "VIM light theme missing"
fi

# Test 2: JSON validation
print_info "Testing JSON validity..."

if command -v jq &> /dev/null; then
    if jq empty themes/ib-theme-dark.json 2>/dev/null; then
        print_test "PASS" "Dark theme JSON is valid"
    else
        print_test "FAIL" "Dark theme JSON is invalid"
    fi
    
    if jq empty themes/ib-theme-light.json 2>/dev/null; then
        print_test "PASS" "Light theme JSON is valid"
    else
        print_test "FAIL" "Light theme JSON is invalid"
    fi
    
    if jq empty package.json 2>/dev/null; then
        print_test "PASS" "package.json is valid"
    else
        print_test "FAIL" "package.json is invalid"
    fi
else
    print_warning "jq not found, skipping JSON validation"
fi

# Test 3: Check required JSON fields
print_info "Testing theme structure..."

if [ -f "themes/ib-theme-dark.json" ]; then
    if grep -q '"name"' themes/ib-theme-dark.json && \
       grep -q '"type"' themes/ib-theme-dark.json && \
       grep -q '"colors"' themes/ib-theme-dark.json && \
       grep -q '"tokenColors"' themes/ib-theme-dark.json; then
        print_test "PASS" "Dark theme has required fields"
    else
        print_test "FAIL" "Dark theme missing required fields"
    fi
fi

if [ -f "themes/ib-theme-light.json" ]; then
    if grep -q '"name"' themes/ib-theme-light.json && \
       grep -q '"type"' themes/ib-theme-light.json && \
       grep -q '"colors"' themes/ib-theme-light.json && \
       grep -q '"tokenColors"' themes/ib-theme-light.json; then
        print_test "PASS" "Light theme has required fields"
    else
        print_test "FAIL" "Light theme missing required fields"
    fi
fi

# Test 4: Check IBM color usage
print_info "Testing IBM color palette usage..."

IBM_COLORS=("#161616" "#262626" "#393939" "#0f62fe" "#42be65" "#be95ff" "#78a9ff" "#ff7eb6" "#ff8389")

for color in "${IBM_COLORS[@]}"; do
    if grep -q "$color" themes/ib-theme-dark.json; then
        print_test "PASS" "Dark theme uses IBM color $color"
    else
        print_test "FAIL" "Dark theme missing IBM color $color"
    fi
done

# Test 5: Check Emacs theme syntax
print_info "Testing Emacs theme syntax..."

if [ -f "emacs/ib-theme-dark-theme.el" ]; then
    if grep -q "deftheme" emacs/ib-theme-dark-theme.el && \
       grep -q "custom-theme-set-faces" emacs/ib-theme-dark-theme.el && \
       grep -q "provide-theme" emacs/ib-theme-dark-theme.el; then
        print_test "PASS" "Emacs dark theme has proper structure"
    else
        print_test "FAIL" "Emacs dark theme missing required functions"
    fi
fi

if [ -f "emacs/ib-theme-light-theme.el" ]; then
    if grep -q "deftheme" emacs/ib-theme-light-theme.el && \
       grep -q "custom-theme-set-faces" emacs/ib-theme-light-theme.el && \
       grep -q "provide-theme" emacs/ib-theme-light-theme.el; then
        print_test "PASS" "Emacs light theme has proper structure"
    else
        print_test "FAIL" "Emacs light theme missing required functions"
    fi
fi

# Test 6: Check VIM theme syntax
print_info "Testing VIM theme syntax..."

if [ -f "vim/colors/ib-theme-dark.vim" ]; then
    if grep -q "set background=dark" vim/colors/ib-theme-dark.vim && \
       grep -q "hi clear" vim/colors/ib-theme-dark.vim && \
       grep -q "let g:colors_name" vim/colors/ib-theme-dark.vim; then
        print_test "PASS" "VIM dark theme has proper structure"
    else
        print_test "FAIL" "VIM dark theme missing required commands"
    fi
fi

if [ -f "vim/colors/ib-theme-light.vim" ]; then
    if grep -q "set background=light" vim/colors/ib-theme-light.vim && \
       grep -q "hi clear" vim/colors/ib-theme-light.vim && \
       grep -q "let g:colors_name" vim/colors/ib-theme-light.vim; then
        print_test "PASS" "VIM light theme has proper structure"
    else
        print_test "FAIL" "VIM light theme missing required commands"
    fi
fi

# Test 7: Check installation scripts
print_info "Testing installation scripts..."

if [ -x "install.sh" ]; then
    print_test "PASS" "Main install script is executable"
else
    print_test "FAIL" "Main install script not executable"
fi

if [ -x "emacs/install-emacs.sh" ]; then
    print_test "PASS" "Emacs install script is executable"
else
    print_test "FAIL" "Emacs install script not executable"
fi

if [ -x "vim/install-vim.sh" ]; then
    print_test "PASS" "VIM install script is executable"
else
    print_test "FAIL" "VIM install script not executable"
fi

# Test 8: Check documentation
print_info "Testing documentation..."

if [ -f "README.md" ] && [ -s "README.md" ]; then
    print_test "PASS" "README.md exists and is not empty"
else
    print_test "FAIL" "README.md missing or empty"
fi

if [ -f "CHANGELOG.md" ] && [ -s "CHANGELOG.md" ]; then
    print_test "PASS" "CHANGELOG.md exists and is not empty"
else
    print_test "FAIL" "CHANGELOG.md missing or empty"
fi

if [ -f "LICENSE" ] && [ -s "LICENSE" ]; then
    print_test "PASS" "LICENSE file exists and is not empty"
else
    print_test "FAIL" "LICENSE file missing or empty"
fi

# Test 9: Check version consistency
print_info "Testing version consistency..."

if [ -f "package.json" ]; then
    PACKAGE_VERSION=$(grep '"version"' package.json | sed 's/.*"version": "\([^"]*\)".*/\1/')
    if [ -n "$PACKAGE_VERSION" ]; then
        print_test "PASS" "Package version found: $PACKAGE_VERSION"
        
        # Check if version appears in CHANGELOG
        if grep -q "$PACKAGE_VERSION" CHANGELOG.md 2>/dev/null; then
            print_test "PASS" "Version $PACKAGE_VERSION found in CHANGELOG"
        else
            print_test "FAIL" "Version $PACKAGE_VERSION not found in CHANGELOG"
        fi
        
        # Check if version appears in README
        if grep -q "$PACKAGE_VERSION" README.md 2>/dev/null; then
            print_test "PASS" "Version $PACKAGE_VERSION found in README"
        else
            print_test "FAIL" "Version $PACKAGE_VERSION not found in README"
        fi
    else
        print_test "FAIL" "Could not extract version from package.json"
    fi
fi

# Summary
echo ""
echo -e "${BLUE}📊 Test Summary${NC}"
echo -e "${BLUE}===============${NC}"
echo "Tests run: $TESTS_RUN"
echo -e "Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Failed: ${RED}$TESTS_FAILED${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo ""
    echo -e "${GREEN}🎉 All tests passed! Theme is ready for release.${NC}"
    exit 0
else
    echo ""
    echo -e "${RED}❌ Some tests failed. Please fix the issues before release.${NC}"
    exit 1
fi