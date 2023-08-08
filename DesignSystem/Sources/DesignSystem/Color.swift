import SwiftUI

public extension Color {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Color.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system colors.
    /// At any call site that requires a color, type `Color.DesignSystem.<esc>`
    struct DesignSystem {
        public static let accentColor = Color(red: 0.8470588326454163, green: 0.9843137264251709, blue: 0.3137255012989044, opacity: 1)
        public static let labelsPrimary = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let labelsSecondary = Color(red: 0.23529411852359772, green: 0.23529411852359772, blue: 0.26274511218070984, opacity: 0.6000000238418579)
        public static let labelsTertiary = Color(red: 0.23529411852359772, green: 0.23529411852359772, blue: 0.26274511218070984, opacity: 0.30000001192092896)
        public static let labelsQuaternary = Color(red: 0.23529411852359772, green: 0.23529411852359772, blue: 0.26274511218070984, opacity: 0.18000000715255737)
        public static let labelsPrimaryDark = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let labelsSecondaryDark = Color(red: 0.9215686321258545, green: 0.9215686321258545, blue: 0.9607843160629272, opacity: 0.6000000238418579)
        public static let labelsTertiaryDark = Color(red: 0.9215686321258545, green: 0.9215686321258545, blue: 0.9607843160629272, opacity: 0.30000001192092896)
        public static let labelsQuaternaryDark = Color(red: 0.9215686321258545, green: 0.9215686321258545, blue: 0.9607843160629272, opacity: 0.1599999964237213)
        public static let labelsVibrantPrimary = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let labelsVibrantSecondary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.5)
        public static let labelsVibrantTertiary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.4000000059604645)
        public static let labelsVibrantQuaternary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.20000000298023224)
        public static let labelsVibrantPrimaryDark = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let labelsVibrantSecondaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.5)
        public static let labelsVibrantTertiaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.4000000059604645)
        public static let labelsVibrantQuaternaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.20000000298023224)
        public static let graysGray = Color(red: 0.5568627715110779, green: 0.5568627715110779, blue: 0.5764706134796143, opacity: 1)
        public static let graysGrayDark = Color(red: 0.5568627715110779, green: 0.5568627715110779, blue: 0.5764706134796143, opacity: 1)
        public static let graysGray2 = Color(red: 0.6823529601097107, green: 0.6823529601097107, blue: 0.6980392336845398, opacity: 1)
        public static let graysGray2Dark = Color(red: 0.38823530077934265, green: 0.38823530077934265, blue: 0.4000000059604645, opacity: 1)
        public static let graysGray3 = Color(red: 0.7803921699523926, green: 0.7803921699523926, blue: 0.800000011920929, opacity: 1)
        public static let graysGray3Dark = Color(red: 0.2823529541492462, green: 0.2823529541492462, blue: 0.29019609093666077, opacity: 1)
        public static let graysGray4 = Color(red: 0.8196078538894653, green: 0.8196078538894653, blue: 0.8392156958580017, opacity: 1)
        public static let graysGray4Dark = Color(red: 0.22745098173618317, green: 0.22745098173618317, blue: 0.23529411852359772, opacity: 1)
        public static let graysGray5 = Color(red: 0.8980392217636108, green: 0.8980392217636108, blue: 0.9176470637321472, opacity: 1)
        public static let graysGray5Dark = Color(red: 0.1725490242242813, green: 0.1725490242242813, blue: 0.18039216101169586, opacity: 1)
        public static let graysGray6 = Color(red: 0.9490196108818054, green: 0.9490196108818054, blue: 0.9686274528503418, opacity: 1)
        public static let graysGray6Dark = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let graysBlack = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let graysBlackDark = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let graysWhite = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let graysWhiteDark = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let bgPrimary = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let bgSecondary = Color(red: 0.9490196108818054, green: 0.9490196108818054, blue: 0.9686274528503418, opacity: 1)
        public static let bgTertiary = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let bgPrimaryDarkElevated = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let bgSecondaryDarkElevated = Color(red: 0.1725490242242813, green: 0.1725490242242813, blue: 0.18039216101169586, opacity: 1)
        public static let bgTertiaryDarkElevated = Color(red: 0.22745098173618317, green: 0.22745098173618317, blue: 0.23529411852359772, opacity: 1)
        public static let bgPrimaryDarkBase = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let bgSecondaryDarkBase = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let bgTertiaryDarkBase = Color(red: 0.1725490242242813, green: 0.1725490242242813, blue: 0.18039216101169586, opacity: 1)
        public static let bgGroupedPrimary = Color(red: 0.9490196108818054, green: 0.9490196108818054, blue: 0.9686274528503418, opacity: 1)
        public static let bgGroupedSecondary = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let bgGroupedTertiary = Color(red: 0.9490196108818054, green: 0.9490196108818054, blue: 0.9686274528503418, opacity: 1)
        public static let bgGroupedPrimaryDarkElevated = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let bgGroupedSecondaryDarkElevated = Color(red: 0.17100000381469727, green: 0.17100000381469727, blue: 0.18000000715255737, opacity: 1)
        public static let bgGroupedTertiaryDarkElevated = Color(red: 0.22745098173618317, green: 0.22745098173618317, blue: 0.23529411852359772, opacity: 1)
        public static let bgGroupedPrimaryDarkBase = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let bgGroupedSecondaryDarkBase = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let bgGroupedTertiaryDarkBase = Color(red: 0.17100000381469727, green: 0.17100000381469727, blue: 0.18000000715255737, opacity: 1)
        public static let fillsPrimary = Color(red: 0.47058823704719543, green: 0.47058823704719543, blue: 0.501960813999176, opacity: 0.20000000298023224)
        public static let fillsSecondary = Color(red: 0.47058823704719543, green: 0.47058823704719543, blue: 0.501960813999176, opacity: 0.1599999964237213)
        public static let fillsTertiary = Color(red: 0.4627451002597809, green: 0.4627451002597809, blue: 0.501960813999176, opacity: 0.11999999731779099)
        public static let fillsQuaternary = Color(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.501960813999176, opacity: 0.07999999821186066)
        public static let fillsPrimaryDark = Color(red: 0.47058823704719543, green: 0.47058823704719543, blue: 0.501960813999176, opacity: 0.36000001430511475)
        public static let fillsSecondaryDark = Color(red: 0.47058823704719543, green: 0.47058823704719543, blue: 0.501960813999176, opacity: 0.3199999928474426)
        public static let fillsTertiaryDark = Color(red: 0.4627451002597809, green: 0.4627451002597809, blue: 0.501960813999176, opacity: 0.23999999463558197)
        public static let fillsQuaternaryDark = Color(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.501960813999176, opacity: 0.18000000715255737)
        public static let fillsVibrantPrimary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.5)
        public static let fillsVibrantSecondary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.4000000059604645)
        public static let fillsVibrantTertiary = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.20000000298023224)
        public static let fillsVibrantPrimaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.5)
        public static let fillsVibrantSecondaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.4000000059604645)
        public static let fillsVibrantTertiaryDark = Color(red: 0.49803921580314636, green: 0.49803921580314636, blue: 0.49803921580314636, opacity: 0.20000000298023224)
        public static let separatorsOpaque = Color(red: 0.7764706015586853, green: 0.7764706015586853, blue: 0.7843137383460999, opacity: 1)
        public static let separatorsNonOpaque = Color(red: 0.23529411852359772, green: 0.23529411852359772, blue: 0.26274511218070984, opacity: 0.36000001430511475)
        public static let separatorsOpaqueDark = Color(red: 0.21960784494876862, green: 0.21960784494876862, blue: 0.22745098173618317, opacity: 1)
        public static let separatorsNonOpaqueDark = Color(red: 0.3294117748737335, green: 0.3294117748737335, blue: 0.3450980484485626, opacity: 0.6499999761581421)
        public static let materialsThick = Color(red: 0.6000000238418579, green: 0.6000000238418579, blue: 0.6000000238418579, opacity: 0.9700000286102295)
        public static let materialsRegular = Color(red: 0.7019608020782471, green: 0.7019608020782471, blue: 0.7019608020782471, opacity: 0.8199999928474426)
        public static let materialsThin = Color(red: 0.6509804129600525, green: 0.6509804129600525, blue: 0.6509804129600525, opacity: 0.699999988079071)
        public static let materialsUltrathin = Color(red: 0.7490196228027344, green: 0.7490196228027344, blue: 0.7490196228027344, opacity: 0.4399999976158142)
        public static let materialsChrome = Color(red: 1, green: 1, blue: 1, opacity: 0.75)
        public static let materialsThickDark = Color(red: 0.14509804546833038, green: 0.14509804546833038, blue: 0.14509804546833038, opacity: 0.8999999761581421)
        public static let materialsRegularDark = Color(red: 0.14509804546833038, green: 0.14509804546833038, blue: 0.14509804546833038, opacity: 0.8199999928474426)
        public static let materialsThinDark = Color(red: 0.14509804546833038, green: 0.14509804546833038, blue: 0.14509804546833038, opacity: 0.699999988079071)
        public static let materialsUltrathinDark = Color(red: 0.14509804546833038, green: 0.14509804546833038, blue: 0.14509804546833038, opacity: 0.550000011920929)
        public static let materialsChromeDark = Color(red: 0, green: 0, blue: 0, opacity: 0.75)
        public static let colorsRed = Color(red: 1, green: 0.23137255012989044, blue: 0.1882352977991104, opacity: 1)
        public static let colorsRedDark = Color(red: 1, green: 0.2705882489681244, blue: 0.22745098173618317, opacity: 1)
        public static let colorsOrange = Color(red: 1, green: 0.5843137502670288, blue: 0, opacity: 1)
        public static let colorsOrangeDark = Color(red: 1, green: 0.6235294342041016, blue: 0.03921568766236305, opacity: 1)
        public static let colorsYellow = Color(red: 1, green: 0.800000011920929, blue: 0, opacity: 1)
        public static let colorsYellowDark = Color(red: 1, green: 0.8392156958580017, blue: 0.03921568766236305, opacity: 1)
        public static let colorsGreen = Color(red: 0.20392157137393951, green: 0.7803921699523926, blue: 0.3490196168422699, opacity: 1)
        public static let colorsGreenDark = Color(red: 0.1882352977991104, green: 0.8196078538894653, blue: 0.3450980484485626, opacity: 1)
        public static let colorsMint = Color(red: 0, green: 0.7803921699523926, blue: 0.7450980544090271, opacity: 1)
        public static let colorsMintDark = Color(red: 0.38823530077934265, green: 0.9019607901573181, blue: 0.886274516582489, opacity: 1)
        public static let colorsTeal = Color(red: 0.1882352977991104, green: 0.6901960968971252, blue: 0.7803921699523926, opacity: 1)
        public static let colorsTealDark = Color(red: 0.250980406999588, green: 0.7960784435272217, blue: 0.8784313797950745, opacity: 1)
        public static let colorsCyan = Color(red: 0.19607843458652496, green: 0.6784313917160034, blue: 0.9019607901573181, opacity: 1)
        public static let colorsCyanDark = Color(red: 0.3921568691730499, green: 0.8235294222831726, blue: 1, opacity: 1)
        public static let colorsBlue = Color(red: 0, green: 0.47843137383461, blue: 1, opacity: 1)
        public static let colorsBlueDark = Color(red: 0.03921568766236305, green: 0.5176470875740051, blue: 1, opacity: 1)
        public static let colorsIndigo = Color(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, opacity: 1)
        public static let colorsIndigoDark = Color(red: 0.3686274588108063, green: 0.3607843220233917, blue: 0.9019607901573181, opacity: 1)
        public static let colorsPurple = Color(red: 0.686274528503418, green: 0.32156863808631897, blue: 0.8705882430076599, opacity: 1)
        public static let colorsPurpleDark = Color(red: 0.7490196228027344, green: 0.3529411852359772, blue: 0.9490196108818054, opacity: 1)
        public static let colorsPink = Color(red: 1, green: 0.1764705926179886, blue: 0.3333333432674408, opacity: 1)
        public static let colorsPinkDark = Color(red: 1, green: 0.21568627655506134, blue: 0.37254902720451355, opacity: 1)
        public static let colorsBrown = Color(red: 0.6352941393852234, green: 0.5176470875740051, blue: 0.3686274588108063, opacity: 1)
        public static let colorsBrownDark = Color(red: 0.6745098233222961, green: 0.5568627715110779, blue: 0.40784314274787903, opacity: 1)
        public static let templateSheetFill = Color(red: 0.800000011920929, green: 0.800000011920929, blue: 0.800000011920929, opacity: 1)
        public static let templateComponentFill = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.30000001192092896)
        public static let templateSubcomponentFill = Color(red: 0, green: 0.47843137383461, blue: 1, opacity: 0.30000001192092896)
        public static let templateSubmcomponentStroke = Color(red: 0, green: 0.47843137383461, blue: 1, opacity: 1)
    }
}

