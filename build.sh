#!/bin/bash

# iB-theme Build Script
# Builds and packages the theme for distribution
# Usage: ./build.sh [--clean] [--test] [--package]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Build configuration
BUILD_DIR="build"
DIST_DIR="dist"
VERSION=$(grep '"version"' package.json | sed 's/.*"version": "\([^"]*\)".*/\1/')

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to clean build directories
clean_build() {
    print_info "Cleaning build directories..."
    rm -rf "$BUILD_DIR" "$DIST_DIR" *.vsix
    print_success "Build directories cleaned"
}

# Function to run tests
run_tests() {
    print_info "Running test suite..."
    if bash test-themes.sh; then
        print_success "All tests passed"
    else
        print_error "Tests failed"
        exit 1
    fi
}

# Function to validate dependencies
check_dependencies() {
    print_info "Checking dependencies..."
    
    local missing_deps=()
    
    if ! command -v jq &> /dev/null; then
        missing_deps+=("jq")
    fi
    
    if ! command -v npm &> /dev/null; then
        missing_deps+=("npm")
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing dependencies: ${missing_deps[*]}"
        print_info "Install missing dependencies and try again"
        exit 1
    fi
    
    print_success "All dependencies available"
}

# Function to validate JSON files
validate_json() {
    print_info "Validating JSON files..."
    
    local json_files=("package.json" "themes/ib-theme-dark.json" "themes/ib-theme-light.json")
    
    for file in "${json_files[@]}"; do
        if jq empty "$file" 2>/dev/null; then
            print_success "✓ $file is valid"
        else
            print_error "✗ $file is invalid"
            exit 1
        fi
    done
}

# Function to create build directory structure
create_build_structure() {
    print_info "Creating build structure..."
    
    mkdir -p "$BUILD_DIR"/{vscode,emacs,vim}
    mkdir -p "$DIST_DIR"
    
    print_success "Build structure created"
}

# Function to build VS Code extension
build_vscode() {
    print_info "Building VS Code extension..."
    
    # Copy VS Code files
    cp package.json "$BUILD_DIR/vscode/"
    cp -r themes "$BUILD_DIR/vscode/"
    cp README.md "$BUILD_DIR/vscode/"
    cp LICENSE "$BUILD_DIR/vscode/"
    cp CHANGELOG.md "$BUILD_DIR/vscode/"
    cp iB-theme.png "$BUILD_DIR/vscode/" 2>/dev/null || print_warning "Logo not found"
    
    # Create .vscodeignore
    cat > "$BUILD_DIR/vscode/.vscodeignore" << EOF
.vscode/**
.vscode-test/**
out/test/**
test/**
src/**
**/*.map
.gitignore
tsconfig.json
vsc-extension-quickstart.md
**/node_modules/**
**/.eslintrc.json
**/*.vsix
build/**
dist/**
*.sh
emacs/**
vim/**
EOF
    
    # Package extension
    cd "$BUILD_DIR/vscode"
    if command -v vsce &> /dev/null; then
        vsce package --no-yarn
        mv *.vsix "../../$DIST_DIR/"
        print_success "VS Code extension packaged"
    else
        print_warning "vsce not found, installing..."
        npm install -g @vscode/vsce
        vsce package --no-yarn
        mv *.vsix "../../$DIST_DIR/"
        print_success "VS Code extension packaged"
    fi
    cd - > /dev/null
}

# Function to build Emacs package
build_emacs() {
    print_info "Building Emacs package..."
    
    # Copy Emacs files
    cp emacs/*.el "$BUILD_DIR/emacs/"
    cp emacs/README.md "$BUILD_DIR/emacs/"
    cp LICENSE "$BUILD_DIR/emacs/"
    
    # Create Emacs package archive
    cd "$BUILD_DIR/emacs"
    tar -czf "../../$DIST_DIR/ib-theme-emacs-$VERSION.tar.gz" *.el README.md LICENSE
    print_success "Emacs package created"
    cd - > /dev/null
}

# Function to build VIM package
build_vim() {
    print_info "Building VIM package..."
    
    # Copy VIM files
    cp -r vim/colors "$BUILD_DIR/vim/"
    cp vim/README.md "$BUILD_DIR/vim/"
    cp LICENSE "$BUILD_DIR/vim/"
    
    # Create VIM package archive
    cd "$BUILD_DIR/vim"
    tar -czf "../../$DIST_DIR/ib-theme-vim-$VERSION.tar.gz" colors/ README.md LICENSE
    print_success "VIM package created"
    cd - > /dev/null
}

# Function to create checksums
create_checksums() {
    print_info "Creating checksums..."
    
    cd "$DIST_DIR"
    for file in *; do
        if [ -f "$file" ]; then
            sha256sum "$file" >> checksums.txt
        fi
    done
    print_success "Checksums created"
    cd - > /dev/null
}

# Function to show build summary
show_summary() {
    print_info "Build Summary"
    echo "=============="
    echo "Version: $VERSION"
    echo "Build directory: $BUILD_DIR"
    echo "Distribution directory: $DIST_DIR"
    echo ""
    echo "Generated files:"
    ls -la "$DIST_DIR"
    echo ""
    print_success "Build completed successfully!"
}

# Main build function
main() {
    echo -e "${BLUE}🔨 iB-theme Build Script${NC}"
    echo -e "${BLUE}========================${NC}"
    echo ""
    
    # Parse command line arguments
    CLEAN=false
    TEST=false
    PACKAGE=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --clean)
                CLEAN=true
                shift
                ;;
            --test)
                TEST=true
                shift
                ;;
            --package)
                PACKAGE=true
                shift
                ;;
            --help|-h)
                echo "Usage: $0 [--clean] [--test] [--package]"
                echo ""
                echo "Options:"
                echo "  --clean    Clean build directories before building"
                echo "  --test     Run test suite before building"
                echo "  --package  Build distribution packages"
                echo "  --help     Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Execute build steps
    if [ "$CLEAN" = true ]; then
        clean_build
    fi
    
    check_dependencies
    validate_json
    
    if [ "$TEST" = true ]; then
        run_tests
    fi
    
    if [ "$PACKAGE" = true ]; then
        create_build_structure
        build_vscode
        build_emacs
        build_vim
        create_checksums
        show_summary
    else
        print_info "Use --package to build distribution packages"
        print_info "Use --help for more options"
    fi
}

# Run main function
main "$@"