+++
date = "2017-08-02T15:48:31+02:00"
draft = false
title = "Swift DateFormatter sample data"

+++

```swift
//: Playground - noun: a place where people can play

import Foundation

extension DateFormatter.Style {
    var styleName: String {
        switch self {
        case .full:
            return ".full"
        case .long:
            return ".long"
        case .medium:
            return ".medium"
        case .short:
            return ".short"
        case .none:
            return ".none"
        }
    }
}

let locales = [ Locale(identifier: "de_DE"), Locale(identifier: "en_US"), Locale(identifier: "fr_FR"), Locale(identifier: "es_ES"), Locale(identifier: "ru_RU") ]
let styles = [ DateFormatter.Style.none, DateFormatter.Style.short, DateFormatter.Style.medium, DateFormatter.Style.long, DateFormatter.Style.full ]

let dateFormatter = DateFormatter()

for locale in locales {
    dateFormatter.locale = locale
    print("Locale: \(locale.debugDescription)")
    for timeStyle in styles {
        dateFormatter.timeStyle = timeStyle
        for dateStyle in styles {
            dateFormatter.dateStyle = dateStyle
            print("\ttimeStyle: \(timeStyle.styleName), dateStyle: \(dateStyle.styleName)")
            print("\t\t\(dateFormatter.string(from: Date()))")
        }
    }
}
```

<pre>
Locale: de_DE (fixed)
    timeStyle: .none, dateStyle: .none
	
    timeStyle: .none, dateStyle: .short
	02.08.17
    timeStyle: .none, dateStyle: .medium
	02.08.2017
    timeStyle: .none, dateStyle: .long
	2. August 2017
    timeStyle: .none, dateStyle: .full
	Mittwoch, 2. August 2017
    timeStyle: .short, dateStyle: .none
	15:46
    timeStyle: .short, dateStyle: .short
	02.08.17, 15:46
    timeStyle: .short, dateStyle: .medium
	02.08.2017, 15:46
    timeStyle: .short, dateStyle: .long
	2. August 2017 um 15:46
    timeStyle: .short, dateStyle: .full
	Mittwoch, 2. August 2017 um 15:46
    timeStyle: .medium, dateStyle: .none
	15:46:48
    timeStyle: .medium, dateStyle: .short
	02.08.17, 15:46:48
    timeStyle: .medium, dateStyle: .medium
	02.08.2017, 15:46:48
    timeStyle: .medium, dateStyle: .long
	2. August 2017 um 15:46:48
    timeStyle: .medium, dateStyle: .full
	Mittwoch, 2. August 2017 um 15:46:48
    timeStyle: .long, dateStyle: .none
	15:46:48 MESZ
    timeStyle: .long, dateStyle: .short
	02.08.17, 15:46:48 MESZ
    timeStyle: .long, dateStyle: .medium
	02.08.2017, 15:46:48 MESZ
    timeStyle: .long, dateStyle: .long
	2. August 2017 um 15:46:48 MESZ
    timeStyle: .long, dateStyle: .full
	Mittwoch, 2. August 2017 um 15:46:48 MESZ
    timeStyle: .full, dateStyle: .none
	15:46:48 Mitteleuropäische Sommerzeit
    timeStyle: .full, dateStyle: .short
	02.08.17, 15:46:48 Mitteleuropäische Sommerzeit
    timeStyle: .full, dateStyle: .medium
	02.08.2017, 15:46:48 Mitteleuropäische Sommerzeit
    timeStyle: .full, dateStyle: .long
	2. August 2017 um 15:46:48 Mitteleuropäische Sommerzeit
    timeStyle: .full, dateStyle: .full
	Mittwoch, 2. August 2017 um 15:46:48 Mitteleuropäische Sommerzeit
Locale: en_US (fixed)
    timeStyle: .none, dateStyle: .none
	
    timeStyle: .none, dateStyle: .short
	8/2/17
    timeStyle: .none, dateStyle: .medium
	Aug 2, 2017
    timeStyle: .none, dateStyle: .long
	August 2, 2017
    timeStyle: .none, dateStyle: .full
	Wednesday, August 2, 2017
    timeStyle: .short, dateStyle: .none
	3:46 PM
    timeStyle: .short, dateStyle: .short
	8/2/17, 3:46 PM
    timeStyle: .short, dateStyle: .medium
	Aug 2, 2017, 3:46 PM
    timeStyle: .short, dateStyle: .long
	August 2, 2017 at 3:46 PM
    timeStyle: .short, dateStyle: .full
	Wednesday, August 2, 2017 at 3:46 PM
    timeStyle: .medium, dateStyle: .none
	3:46:48 PM
    timeStyle: .medium, dateStyle: .short
	8/2/17, 3:46:48 PM
    timeStyle: .medium, dateStyle: .medium
	Aug 2, 2017, 3:46:48 PM
    timeStyle: .medium, dateStyle: .long
	August 2, 2017 at 3:46:48 PM
    timeStyle: .medium, dateStyle: .full
	Wednesday, August 2, 2017 at 3:46:48 PM
    timeStyle: .long, dateStyle: .none
	3:46:48 PM GMT+2
    timeStyle: .long, dateStyle: .short
	8/2/17, 3:46:48 PM GMT+2
    timeStyle: .long, dateStyle: .medium
	Aug 2, 2017, 3:46:48 PM GMT+2
    timeStyle: .long, dateStyle: .long
	August 2, 2017 at 3:46:48 PM GMT+2
    timeStyle: .long, dateStyle: .full
	Wednesday, August 2, 2017 at 3:46:48 PM GMT+2
    timeStyle: .full, dateStyle: .none
	3:46:48 PM Central European Summer Time
    timeStyle: .full, dateStyle: .short
	8/2/17, 3:46:48 PM Central European Summer Time
    timeStyle: .full, dateStyle: .medium
	Aug 2, 2017, 3:46:48 PM Central European Summer Time
    timeStyle: .full, dateStyle: .long
	August 2, 2017 at 3:46:48 PM Central European Summer Time
    timeStyle: .full, dateStyle: .full
	Wednesday, August 2, 2017 at 3:46:48 PM Central European Summer Time
Locale: fr_FR (fixed)
    timeStyle: .none, dateStyle: .none
	
    timeStyle: .none, dateStyle: .short
	02/08/2017
    timeStyle: .none, dateStyle: .medium
	2 août 2017
    timeStyle: .none, dateStyle: .long
	2 août 2017
    timeStyle: .none, dateStyle: .full
	mercredi 2 août 2017
    timeStyle: .short, dateStyle: .none
	15:46
    timeStyle: .short, dateStyle: .short
	02/08/2017 15:46
    timeStyle: .short, dateStyle: .medium
	2 août 2017 à 15:46
    timeStyle: .short, dateStyle: .long
	2 août 2017 à 15:46
    timeStyle: .short, dateStyle: .full
	mercredi 2 août 2017 à 15:46
    timeStyle: .medium, dateStyle: .none
	15:46:48
    timeStyle: .medium, dateStyle: .short
	02/08/2017 15:46:48
    timeStyle: .medium, dateStyle: .medium
	2 août 2017 à 15:46:48
    timeStyle: .medium, dateStyle: .long
	2 août 2017 à 15:46:48
    timeStyle: .medium, dateStyle: .full
	mercredi 2 août 2017 à 15:46:48
    timeStyle: .long, dateStyle: .none
	15:46:48 UTC+2
    timeStyle: .long, dateStyle: .short
	02/08/2017 15:46:48 UTC+2
    timeStyle: .long, dateStyle: .medium
	2 août 2017 à 15:46:48 UTC+2
    timeStyle: .long, dateStyle: .long
	2 août 2017 à 15:46:48 UTC+2
    timeStyle: .long, dateStyle: .full
	mercredi 2 août 2017 à 15:46:48 UTC+2
    timeStyle: .full, dateStyle: .none
	15:46:48 heure d’été d’Europe centrale
    timeStyle: .full, dateStyle: .short
	02/08/2017 15:46:48 heure d’été d’Europe centrale
    timeStyle: .full, dateStyle: .medium
	2 août 2017 à 15:46:48 heure d’été d’Europe centrale
    timeStyle: .full, dateStyle: .long
	2 août 2017 à 15:46:48 heure d’été d’Europe centrale
    timeStyle: .full, dateStyle: .full
	mercredi 2 août 2017 à 15:46:48 heure d’été d’Europe centrale
Locale: es_ES (fixed)
    timeStyle: .none, dateStyle: .none
	
    timeStyle: .none, dateStyle: .short
	2/8/17
    timeStyle: .none, dateStyle: .medium
	2 ago 2017
    timeStyle: .none, dateStyle: .long
	2 de agosto de 2017
    timeStyle: .none, dateStyle: .full
	miércoles, 2 de agosto de 2017
    timeStyle: .short, dateStyle: .none
	15:46
    timeStyle: .short, dateStyle: .short
	2/8/17 15:46
    timeStyle: .short, dateStyle: .medium
	2 ago 2017 15:46
    timeStyle: .short, dateStyle: .long
	2 de agosto de 2017, 15:46
    timeStyle: .short, dateStyle: .full
	miércoles, 2 de agosto de 2017, 15:46
    timeStyle: .medium, dateStyle: .none
	15:46:48
    timeStyle: .medium, dateStyle: .short
	2/8/17 15:46:48
    timeStyle: .medium, dateStyle: .medium
	2 ago 2017 15:46:48
    timeStyle: .medium, dateStyle: .long
	2 de agosto de 2017, 15:46:48
    timeStyle: .medium, dateStyle: .full
	miércoles, 2 de agosto de 2017, 15:46:48
    timeStyle: .long, dateStyle: .none
	15:46:48 CEST
    timeStyle: .long, dateStyle: .short
	2/8/17 15:46:48 CEST
    timeStyle: .long, dateStyle: .medium
	2 ago 2017 15:46:48 CEST
    timeStyle: .long, dateStyle: .long
	2 de agosto de 2017, 15:46:48 CEST
    timeStyle: .long, dateStyle: .full
	miércoles, 2 de agosto de 2017, 15:46:48 CEST
    timeStyle: .full, dateStyle: .none
	15:46:48 (hora de verano de Europa central)
    timeStyle: .full, dateStyle: .short
	2/8/17 15:46:48 (hora de verano de Europa central)
    timeStyle: .full, dateStyle: .medium
	2 ago 2017 15:46:48 (hora de verano de Europa central)
    timeStyle: .full, dateStyle: .long
	2 de agosto de 2017, 15:46:48 (hora de verano de Europa central)
    timeStyle: .full, dateStyle: .full
	miércoles, 2 de agosto de 2017, 15:46:48 (hora de verano de Europa central)
Locale: ru_RU (fixed)
    timeStyle: .none, dateStyle: .none
	
    timeStyle: .none, dateStyle: .short
	02.08.17
    timeStyle: .none, dateStyle: .medium
	2 авг. 2017 г.
    timeStyle: .none, dateStyle: .long
	2 августа 2017 г.
    timeStyle: .none, dateStyle: .full
	среда, 2 августа 2017 г.
    timeStyle: .short, dateStyle: .none
	15:46
    timeStyle: .short, dateStyle: .short
	02.08.17, 15:46
    timeStyle: .short, dateStyle: .medium
	2 авг. 2017 г., 15:46
    timeStyle: .short, dateStyle: .long
	2 августа 2017 г., 15:46
    timeStyle: .short, dateStyle: .full
	среда, 2 августа 2017 г., 15:46
    timeStyle: .medium, dateStyle: .none
	15:46:48
    timeStyle: .medium, dateStyle: .short
	02.08.17, 15:46:48
    timeStyle: .medium, dateStyle: .medium
	2 авг. 2017 г., 15:46:48
    timeStyle: .medium, dateStyle: .long
	2 августа 2017 г., 15:46:48
    timeStyle: .medium, dateStyle: .full
	среда, 2 августа 2017 г., 15:46:48
    timeStyle: .long, dateStyle: .none
	15:46:48 GMT+2
    timeStyle: .long, dateStyle: .short
	02.08.17, 15:46:48 GMT+2
    timeStyle: .long, dateStyle: .medium
	2 авг. 2017 г., 15:46:48 GMT+2
    timeStyle: .long, dateStyle: .long
	2 августа 2017 г., 15:46:48 GMT+2
    timeStyle: .long, dateStyle: .full
	среда, 2 августа 2017 г., 15:46:48 GMT+2
    timeStyle: .full, dateStyle: .none
	15:46:48 Центральная Европа, летнее время
    timeStyle: .full, dateStyle: .short
	02.08.17, 15:46:48 Центральная Европа, летнее время
    timeStyle: .full, dateStyle: .medium
	2 авг. 2017 г., 15:46:48 Центральная Европа, летнее время
    timeStyle: .full, dateStyle: .long
	2 августа 2017 г., 15:46:48 Центральная Европа, летнее время
    timeStyle: .full, dateStyle: .full
	среда, 2 августа 2017 г., 15:46:48 Центральная Европа, летнее время
</pre>
