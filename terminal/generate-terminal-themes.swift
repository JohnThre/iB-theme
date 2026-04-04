#!/usr/bin/env swift

// generate-terminal-themes.swift
// Generates macOS Terminal.app .terminal profile files for iB-theme
// Uses IBM Carbon Design System color palette
// Run: swift terminal/generate-terminal-themes.swift

import AppKit
import Foundation

// MARK: - Color Palette (IBM Carbon Design System)

struct ThemeColors {
    let name: String
    let background: String
    let foreground: String
    let boldText: String
    let cursor: String
    let selectionR: CGFloat
    let selectionG: CGFloat
    let selectionB: CGFloat
    let selectionA: CGFloat
    let ansiBlack: String
    let ansiRed: String
    let ansiGreen: String
    let ansiYellow: String
    let ansiBlue: String
    let ansiMagenta: String
    let ansiCyan: String
    let ansiWhite: String
    let ansiBrightBlack: String
    let ansiBrightRed: String
    let ansiBrightGreen: String
    let ansiBrightYellow: String
    let ansiBrightBlue: String
    let ansiBrightMagenta: String
    let ansiBrightCyan: String
    let ansiBrightWhite: String
}

let darkTheme = ThemeColors(
    name: "iB-theme Dark",
    background: "#161616",
    foreground: "#ffffff",
    boldText: "#ffffff",
    cursor: "#0f62fe",
    selectionR: 0.059, selectionG: 0.384, selectionB: 0.996, selectionA: 0.25,
    ansiBlack: "#393939",
    ansiRed: "#ff8389",
    ansiGreen: "#42be65",
    ansiYellow: "#f1c21b",
    ansiBlue: "#78a9ff",
    ansiMagenta: "#be95ff",
    ansiCyan: "#33b1ff",
    ansiWhite: "#c6c6c6",
    ansiBrightBlack: "#6f6f6f",
    ansiBrightRed: "#ff7eb6",
    ansiBrightGreen: "#42be65",
    ansiBrightYellow: "#fdd13a",
    ansiBrightBlue: "#0f62fe",
    ansiBrightMagenta: "#ff7eb6",
    ansiBrightCyan: "#33b1ff",
    ansiBrightWhite: "#ffffff"
)

let lightTheme = ThemeColors(
    name: "iB-theme Light",
    background: "#ffffff",
    foreground: "#161616",
    boldText: "#161616",
    cursor: "#0f62fe",
    selectionR: 0.059, selectionG: 0.384, selectionB: 0.996, selectionA: 0.25,
    ansiBlack: "#161616",
    ansiRed: "#da1e28",
    ansiGreen: "#198038",
    ansiYellow: "#f1c21b",
    ansiBlue: "#0043ce",
    ansiMagenta: "#8a3ffc",
    ansiCyan: "#1192e8",
    ansiWhite: "#525252",
    ansiBrightBlack: "#6f6f6f",
    ansiBrightRed: "#9f1853",
    ansiBrightGreen: "#198038",
    ansiBrightYellow: "#fdd13a",
    ansiBrightBlue: "#0f62fe",
    ansiBrightMagenta: "#9f1853",
    ansiBrightCyan: "#1192e8",
    ansiBrightWhite: "#161616"
)

// MARK: - Hex to NSColor

func hexToNSColor(_ hex: String) -> NSColor {
    let h = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    let scanner = Scanner(string: h)
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
    let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
    let b = CGFloat(rgb & 0xFF) / 255.0
    return NSColor(srgbRed: r, green: g, blue: b, alpha: 1.0)
}

// MARK: - Archive NSColor to base64

func archiveColor(_ color: NSColor) -> String {
    let data = try! NSKeyedArchiver.archivedData(
        withRootObject: color,
        requiringSecureCoding: true
    )
    return data.base64EncodedString(options: [.lineLength76Characters, .endLineWithLineFeed])
}

func archiveColorFromHex(_ hex: String) -> String {
    return archiveColor(hexToNSColor(hex))
}

// MARK: - Archive default font

func archiveFont() -> String {
    let font = NSFont.monospacedSystemFont(ofSize: 12, weight: .regular)
    let data = try! NSKeyedArchiver.archivedData(
        withRootObject: font,
        requiringSecureCoding: true
    )
    return data.base64EncodedString(options: [.lineLength76Characters, .endLineWithLineFeed])
}

// MARK: - Generate .terminal plist XML

func generateTerminalPlist(_ theme: ThemeColors) -> String {
    let selectionColor = NSColor(
        srgbRed: theme.selectionR,
        green: theme.selectionG,
        blue: theme.selectionB,
        alpha: theme.selectionA
    )

    let colors: [(String, String)] = [
        ("BackgroundColor", archiveColorFromHex(theme.background)),
        ("TextColor", archiveColorFromHex(theme.foreground)),
        ("TextBoldColor", archiveColorFromHex(theme.boldText)),
        ("CursorColor", archiveColorFromHex(theme.cursor)),
        ("CursorTextColor", archiveColorFromHex(theme.background)),
        ("SelectionColor", archiveColor(selectionColor)),
        ("ANSIBlackColor", archiveColorFromHex(theme.ansiBlack)),
        ("ANSIRedColor", archiveColorFromHex(theme.ansiRed)),
        ("ANSIGreenColor", archiveColorFromHex(theme.ansiGreen)),
        ("ANSIYellowColor", archiveColorFromHex(theme.ansiYellow)),
        ("ANSIBlueColor", archiveColorFromHex(theme.ansiBlue)),
        ("ANSIMagentaColor", archiveColorFromHex(theme.ansiMagenta)),
        ("ANSICyanColor", archiveColorFromHex(theme.ansiCyan)),
        ("ANSIWhiteColor", archiveColorFromHex(theme.ansiWhite)),
        ("ANSIBrightBlackColor", archiveColorFromHex(theme.ansiBrightBlack)),
        ("ANSIBrightRedColor", archiveColorFromHex(theme.ansiBrightRed)),
        ("ANSIBrightGreenColor", archiveColorFromHex(theme.ansiBrightGreen)),
        ("ANSIBrightYellowColor", archiveColorFromHex(theme.ansiBrightYellow)),
        ("ANSIBrightBlueColor", archiveColorFromHex(theme.ansiBrightBlue)),
        ("ANSIBrightMagentaColor", archiveColorFromHex(theme.ansiBrightMagenta)),
        ("ANSIBrightCyanColor", archiveColorFromHex(theme.ansiBrightCyan)),
        ("ANSIBrightWhiteColor", archiveColorFromHex(theme.ansiBrightWhite)),
    ]

    let fontData = archiveFont()

    var xml = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
    \t<key>name</key>
    \t<string>\(theme.name)</string>
    \t<key>type</key>
    \t<string>Window Settings</string>
    \t<key>ProfileCurrentVersion</key>
    \t<real>2.08</real>

    """

    for (key, value) in colors {
        xml += "\t<key>\(key)</key>\n"
        xml += "\t<data>\n\(value)\n\t</data>\n"
    }

    xml += """
    \t<key>Font</key>
    \t<data>
    \(fontData)
    \t</data>
    \t<key>FontAntialias</key>
    \t<true/>
    \t<key>FontWidthSpacing</key>
    \t<real>1.004032258064516</real>
    \t<key>UseBoldFonts</key>
    \t<true/>
    \t<key>DisableANSIColor</key>
    \t<false/>
    \t<key>UseBrightBold</key>
    \t<true/>
    \t<key>columnCount</key>
    \t<integer>120</integer>
    \t<key>rowCount</key>
    \t<integer>35</integer>
    \t<key>ShouldLimitScrollback</key>
    \t<integer>0</integer>
    \t<key>ShowRepresentedURLInTitle</key>
    \t<true/>
    \t<key>ShowRepresentedURLPathInTitle</key>
    \t<true/>
    \t<key>ShowActiveProcessInTitle</key>
    \t<true/>
    \t<key>ShowWindowSettingsNameInTitle</key>
    \t<false/>
    </dict>
    </plist>
    """

    return xml
}

// MARK: - Main

let scriptURL = URL(fileURLWithPath: CommandLine.arguments[0])
let scriptDir = scriptURL.deletingLastPathComponent()

// If run from project root (swift terminal/generate-terminal-themes.swift),
// scriptDir will be "terminal/". If run from terminal/ dir, adjust accordingly.
let outputDir: URL
if scriptDir.lastPathComponent == "terminal" {
    outputDir = scriptDir
} else {
    outputDir = scriptDir.appendingPathComponent("terminal")
}

let themes: [(ThemeColors, String)] = [
    (darkTheme, "ib-theme-dark.terminal"),
    (lightTheme, "ib-theme-light.terminal"),
]

for (theme, filename) in themes {
    let plist = generateTerminalPlist(theme)
    let outputPath = outputDir.appendingPathComponent(filename)
    try! plist.write(to: outputPath, atomically: true, encoding: .utf8)
    print("Generated: \(outputPath.path)")
}

print("Done. Import into Terminal.app via Settings > Profiles > Import.")
