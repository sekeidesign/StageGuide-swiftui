import SwiftUI

public extension Font {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Font.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system fonts.
    /// At any call site that requires a font, type `Font.DesignSystem.<esc>`
    struct DesignSystem {
        public static let largeTitleRegular = Font.custom("SatoshiVariable-Regular", size: 34)
        public static let largeTitleEmphasized = Font.custom("SatoshiVariable-Bold", size: 34)
        public static let title1Regular = Font.custom("SatoshiVariable-Regular", size: 28)
        public static let title1Emphasized = Font.custom("SatoshiVariable-Bold", size: 28)
        public static let title2Regular = Font.custom("SatoshiVariable-Regular", size: 22)
        public static let title2Emphasized = Font.custom("SatoshiVariable-Bold", size: 22)
        public static let title3Regular = Font.custom("SatoshiVariable-Regular", size: 20)
        public static let title3Emphasized = Font.custom("SatoshiVariable-Bold", size: 20)
        public static let headlineRegular = Font.custom("SatoshiVariable-Medium", size: 17)
        public static let headlineItalic = Font.custom("SatoshiVariable-MediumItalic", size: 17)
        public static let bodyRegular = Font.custom("SatoshiVariable-Regular", size: 17)
        public static let bodyEmphasized = Font.custom("SatoshiVariable-Bold", size: 17)
        public static let bodyItalic = Font.custom("SatoshiVariable-Italic", size: 17)
        public static let bodyEmphasizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 17)
        public static let calloutRegular = Font.custom("SatoshiVariable-Regular", size: 16)
        public static let calloutEmphasized = Font.custom("SatoshiVariable-Bold", size: 16)
        public static let calloutItalic = Font.custom("SatoshiVariable-Italic", size: 16)
        public static let calloutEmphasizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 16)
        public static let subheadlineRegular = Font.custom("SatoshiVariable-Regular", size: 15)
        public static let subheadlineEmphasized = Font.custom("SatoshiVariable-Bold", size: 15)
        public static let subheadlineItalic = Font.custom("SatoshiVariable-Italic", size: 15)
        public static let subheadlineEmphaizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 15)
        public static let footnoteRegular = Font.custom("SatoshiVariable-Regular", size: 13)
        public static let footnoteEmphasized = Font.custom("SatoshiVariable-Bold", size: 13)
        public static let footnoteItalic = Font.custom("SatoshiVariable-Italic", size: 13)
        public static let footnoteEmphasizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 13)
        public static let caption1Regular = Font.custom("SatoshiVariable-Regular", size: 12)
        public static let caption1Emphasized = Font.custom("SatoshiVariable-Bold", size: 12)
        public static let caption1Italic = Font.custom("SatoshiVariable-Regular", size: 12)
        public static let caption1EmphasizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 12)
        public static let caption2Regular = Font.custom("SatoshiVariable-Regular", size: 11)
        public static let caption2Emphasized = Font.custom("SatoshiVariable-Bold", size: 11)
        public static let caption2Italic = Font.custom("SatoshiVariable-Italic", size: 11)
        public static let caption2EmphasizedItalic = Font.custom("SatoshiVariable-BoldItalic", size: 11)
    }
}
