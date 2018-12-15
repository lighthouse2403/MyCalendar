//
//  DateMacro.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 12/4/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class DateMacro: NSObject {
    
   static func getComponents(_ date: Date) -> DateComponents {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.day, .month, .year, .hour, .minute, .second, .weekday])
        return calendar.dateComponents(unitFlags, from: date)
    }
    
    static func jdFromDate(_ dd: Int, mm: Int, yy: Int) -> Int {
        var a, y, m, jd : Int
        a = Int((14 - mm) / 12)
        y = yy+4800-a
        m = mm+12*a-3
        jd = dd + Int((153*m+2)/5) + 365*y + Int(y/4) - Int(y/100) + Int(y/400) - 32045
        if (jd < 2299161) {
            jd = dd + Int((153*m+2)/5) + 365*y + Int(y/4) - 32083
        }
        return jd
    }
    
    static func jdToDate(_ jd: Int) -> (Int,Int,Int) {
        var a, b, c, d, e, m, day, month, year: Int
        if (jd > 2299160) { // After 5/10/1582, Gregorian calendar
            a = jd + 32044
            b = Int((4*a+3)/146097)
            c = a - Int((b*146097)/4)
        } else {
            b = 0
            c = jd + 32082
        }
        d = Int((4*c+3)/1461)
        e = c - Int((1461*d)/4)
        m = Int((5*e+2)/153)
        day = e - Int((153*m+2)/5) + 1
        month = m + 3 - 12*Int(m/10)
        year = b*100 + d - 4800 + Int(m/10)
        return (day, month, year)
    }
    
    // Tính ngày sóc
    static func getNewMoonDay(_ k: Int, timeZone: Double) -> Double {
        var T, T2, T3, dr, Jd1, M, Mpr, F, C1, deltat, JdNew: Double
        T = Double(k)/1236.85 // Time in Julian centuries from 1900 January 0.5
        T2 = T * T
        T3 = T2 * T
        dr = Double.pi/180
        Jd1 = 2415020.75933 + 29.53058868*Double(k) + 0.0001178*T2 - 0.000000155*T3
        Jd1 = Jd1 + 0.00033*sin((166.56 + 132.87*T - 0.009173*T2)*dr) // Mean new moon
        M = 359.2242 + 29.10535608*Double(k) - 0.0000333*T2 - 0.00000347*T3 // Sun's mean anomaly
        Mpr = 306.0253 + 385.81691806*Double(k) + 0.0107306*T2 + 0.00001236*T3 // Moon's mean anomaly
        F = 21.2964 + 390.67050646*Double(k) - 0.0016528*T2 - 0.00000239*T3 // Moon's argument of latitude
        C1=(0.1734 - 0.000393*T)*sin(M*dr) + 0.0021*sin(2*dr*M)
        C1 = C1 - 0.4068*sin(Mpr*dr) + 0.0161*sin(dr*2*Mpr)
        C1 = C1 - 0.0004*sin(dr*3*Mpr)
        C1 = C1 + 0.0104*sin(dr*2*F) - 0.0051*sin(dr*(M+Mpr))
        C1 = C1 - 0.0074*sin(dr*(M-Mpr)) + 0.0004*sin(dr*(2*F+M))
        C1 = C1 - 0.0004*sin(dr*(2*F-M)) - 0.0006*sin(dr*(2*F+Mpr))
        C1 = C1 + 0.0010*sin(dr*(2*F-Mpr)) + 0.0005*sin(dr*(2*Mpr+M))
        if (T < -11) {
            deltat = 0.001 + 0.000839*T + 0.0002261*T2 - 0.00000845*T3 - 0.000000081*T*T3
        } else {
            deltat = -0.000278 + 0.000265*T + 0.000262*T2
        };
        JdNew = Jd1 + C1 - deltat
        return JdNew + 0.5 + timeZone/24
    }
    
    // Tính toạ độ mặt trời
    static func getSunLongitude(_ jdn: Double, timeZone: Double) -> Int {
        var T, T2, dr, M, L0, DL, L: Double
        T = (jdn - 2451545.5 - timeZone/24) / 36525 // Time in Julian centuries from 2000-01-01 12:00:00 GMT
        T2 = T*T
        dr = Double.pi/180 // degree to radian
        M = 357.52910 + 35999.05030*T - 0.0001559*T2 - 0.00000048*T*T2 // mean anomaly, degree
        L0 = 280.46645 + 36000.76983*T + 0.0003032*T2 // mean longitude, degree
        DL = (1.914600 - 0.004817*T - 0.000014*T2)*sin(dr*M)
        DL = DL + (0.019993 - 0.000101*T)*sin(dr*2*M) + 0.000290*sin(dr*3*M)
        L = L0 + DL // true longitude, degree
        L = L*dr
        L = L - Double.pi*2*Double((Int(L/(Double.pi*2)))) // Normalize to (0, 2*PI)
        return Int(L / Double.pi * 6)
    }
    
    // Tính ngày bắt đầu tháng âm lịch
    static func getLunarMonth11(_ yy: Int, timeZone: Double) -> Int {
        var k, off, nm, sunLong: Int
        off = self.jdFromDate(31, mm: 12, yy: yy) - 2415021
        k = Int(Double(off) / 29.530588853)
        nm = Int(self.getNewMoonDay(k, timeZone: timeZone))
        sunLong = Int(getSunLongitude(Double(nm), timeZone: timeZone)) // sun longitude at local midnight
        if (sunLong >= 9) {
            nm = Int(self.getNewMoonDay(k-1, timeZone: timeZone))
        }
        return nm;
    }
    
    static func getLeapMonthOffset(_ a11: Int, timeZone: Double) -> Int {
        var k, last, arc, i: Int
        k = Int((Double(a11) - 2415021.076998695) / 29.530588853 + 0.5)
        last = 0;
        i = 1 // We start with the month following lunar month 11
        arc = self.getSunLongitude(self.getNewMoonDay(k+i, timeZone: timeZone), timeZone: timeZone)
        repeat {
            last = arc
            i = i + 1
            arc = self.getSunLongitude(self.getNewMoonDay(k+i, timeZone: timeZone), timeZone: timeZone)
        } while (arc != last && i < 14)
        return i-1;
    }
    
    // Đổi ngày dương ra ngày âm
    static func convertSolar2Lunar(_ dd: Int, mm: Int, yy: Int, timeZone: Double) -> (Int, Int, Int){
        var k, dayNumber, monthStart, a11, b11, lunarDay, lunarMonth, lunarYear, lunarLeap, diff, leapMonthDiff: Int
        dayNumber = self.jdFromDate(dd, mm: mm, yy: yy)
        k = Int((Double(dayNumber) - 2415021.076998695) / 29.530588853)
        monthStart = Int(self.getNewMoonDay(k+1, timeZone: timeZone))
        if (monthStart > dayNumber) {
            monthStart = Int(self.getNewMoonDay(k, timeZone: timeZone))
        }
        a11 = self.getLunarMonth11(yy, timeZone: timeZone)
        b11 = a11;
        if (a11 >= monthStart) {
            lunarYear = yy;
            a11 = self.getLunarMonth11(yy-1, timeZone: timeZone)
        } else {
            lunarYear = yy+1;
            b11 = self.getLunarMonth11(yy+1, timeZone: timeZone)
        }
        lunarDay = dayNumber-monthStart+1
        diff = Int((monthStart - a11)/29)
        lunarLeap = 0
        lunarMonth = diff+11
        if (b11 - a11 > 365) {
            leapMonthDiff = self.getLeapMonthOffset(a11, timeZone: timeZone)
            if (diff >= leapMonthDiff) {
                lunarMonth = diff + 10
                if (diff == leapMonthDiff) {
                    lunarLeap = 1
                }
            }
        }
        if (lunarMonth > 12) {
            lunarMonth = lunarMonth - 12
        }
        if (lunarMonth >= 11 && diff < 4) {
            lunarYear -= 1
        }
        return (lunarDay, lunarMonth, lunarYear)
    }
    
    // Đổi ngày âm ra ngày dương
    static func convertLunar2Solar(_ lunarDay: Int, lunarMonth: Int, lunarYear: Int, lunarLeap: Int, timeZone: Double) -> (Int, Int, Int) {
        var k, a11, b11, off, leapOff, leapMonth, monthStart : Int
        if (lunarMonth < 11) {
            a11 = self.getLunarMonth11(lunarYear-1, timeZone: timeZone)
            b11 = self.getLunarMonth11(lunarYear, timeZone: timeZone)
        } else {
            a11 = self.getLunarMonth11(lunarYear, timeZone: timeZone)
            b11 = self.getLunarMonth11(lunarYear+1, timeZone: timeZone)
        }
        off = lunarMonth - 11
        if (off < 0) {
            off += 12
        }
        if (b11 - a11 > 365) {
            leapOff = self.getLeapMonthOffset(a11, timeZone: timeZone)
            leapMonth = leapOff - 2
            if (leapMonth < 0) {
                leapMonth += 12
            }
            if (lunarLeap != 0 && lunarMonth != leapMonth) {
                return (0, 0, 0)
            } else if (lunarLeap != 0 || off >= leapOff) {
                off += 1
            }
        }
        k = Int(0.5 + (Double(a11) - 2415021.076998695) / 29.530588853)
        monthStart = Int(self.getNewMoonDay(k+off, timeZone: timeZone))
        return self.jdToDate(monthStart+lunarDay-1)
    }
    
    static func dateToDayOfWeek(date: Date) -> String {
//        let jd = self.jdFromDate(dd, mm: mm, yy: yy)
//        let x = Int(jd%7)
        let component   = DateMacro.getComponents(date)
        let weekDay     = component.weekday
        switch weekDay {
        case 1:
            return "Chủ Nhật"
        case 2:
            return "Thứ Hai"
        case 3:
            return "Thứ Ba"
        case 4:
            return "Thứ Tư"
        case 5:
            return "Thứ Năm"
        case 6:
            return "Thứ Sáu"
        default:
            return "Thứ Bảy"
        }
    }
    
    static func getCan(_ year: Int) -> String {
        let index = year%10
        return arrCan[index]
    }
    
    static func getChi(_ year: Int) -> String {
        let index = year%12
        return arrChi[index]
    }
    
    static func dateToCanChi(_ dd: Int, mm: Int, yy: Int) -> String {
        let jd = self.jdFromDate(dd, mm: mm, yy: yy)
        let canIndex = (jd+9)%10
        let chiIndex = (jd+1)%12
        
        return arrCan[canIndex] + " " + arrChi[chiIndex]
    }
    
    static func monthToCanChi(_ lm: Int, ly: Int) -> String {
        let canIndex = (ly*12+lm+3)%10
        let chiIndex = (lm+1)%12
        
        return arrCan[canIndex] + " " + arrChi[chiIndex]
    }
    
    static func yearToCanChi(_ year: Int) -> String {
        let can = self.getCan(year+6)
        let chi = self.getChi(year+8)
        return can + " " + chi
    }
    
//    static func timeToCanChi(_ date: Date) -> String {
//        return ""
//    }
    
    func getChiOfTime( _ date: Date) -> String {
        
        let date0 = self.dateWithHours(date, hours: 0)
        let date1 = self.dateWithHours(date, hours: 1)
        let date3 = self.dateWithHours(date, hours: 3)
        let date5 = self.dateWithHours(date, hours: 5)
        let date7 = self.dateWithHours(date, hours: 7)
        let date9 = self.dateWithHours(date, hours: 9)
        let date11 = self.dateWithHours(date, hours: 11)
        let date13 = self.dateWithHours(date, hours: 13)
        let date15 = self.dateWithHours(date, hours: 15)
        let date17 = self.dateWithHours(date, hours: 17)
        let date19 = self.dateWithHours(date, hours: 19)
        let date21 = self.dateWithHours(date, hours: 21)
        let date23 = self.dateWithHours(date, hours: 23)
        
        var index = 0
        if date >= date1 && date < date3 {
            index = 1
        } else if date >= date3 && date < date5 {
            index = 2
        }else if date >= date5 && date < date7 {
            index = 3
        }else if date >= date7 && date < date9 {
            index = 4
        }else if date >= date9 && date < date11 {
            index = 5
        }else if date >= date11 && date < date13 {
            index = 6
        }else if date >= date13 && date < date15 {
            index = 7
        }else if date >= date15 && date < date17 {
            index = 8
        }else if date >= date17 && date < date19 {
            index = 9
        }else if date >= date19 && date < date21 {
            index = 10
        }else if date >= date21 && date < date23 {
            index = 11
        } else {
            index = 0
        }
        
        return arrChi[index]
    }
    
    func dateWithHours(_ date: Date, hours: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents ()
        dateComponents.hour = hours
        dateComponents.minute = 0
        dateComponents.second = 0
        return calendar.date(byAdding: dateComponents, to: date) ?? Date()
    }
    
    static func generateDatesOfMonth(currentDate: Date) -> [[Double]] {
        let currentStartMonth   = currentDate.startOfMonth().timeIntervalSince1970
        let currentEndMonth     = currentDate.endOfMonth().timeIntervalSince1970

        var dateArray           = [[Double](),[Double](),[Double](),[Double](),[Double](),[Double](),[Double]()]
        
        // Add date of last month
        var lastDate        = currentStartMonth
        let lastComponent   = DateMacro.getComponents(Date.init(timeIntervalSince1970: currentStartMonth))
        var firstWeekDay    = lastComponent.weekday ?? 1
        if firstWeekDay == 1 {
            firstWeekDay = 7
        }
        
        // Check last week date different monday
        if firstWeekDay > 2 {
            for index in 2...(firstWeekDay - 1) {
                lastDate -= 86400
                dateArray[firstWeekDay - 1 - (index - 2) - 1].append(lastDate)
            }
        }
        
        // Add date of this month
        var midDate = currentStartMonth
        while currentEndMonth >= midDate {
            let component   = DateMacro.getComponents(Date.init(timeIntervalSince1970: midDate))
            let weekDay     = component.weekday
            
            let index   = weekDay ?? 1
            dateArray[index - 1].append(midDate)
            
            // Next day
            midDate += 86400
        }
        
        // Add date of last month
        var nextDate        = currentEndMonth
        let nextComponent   = DateMacro.getComponents(Date.init(timeIntervalSince1970: currentEndMonth))
        let lastWeekDay     = nextComponent.weekday ?? 1

        if lastWeekDay != 1 {
            // Check last week date different saturday
            if lastWeekDay < 7 {
                for index in (lastWeekDay + 1)...7 {
                    nextDate += 86400
                    dateArray[index - 1].append(nextDate)
                }
            }
            
            dateArray[0].append(nextDate + 86400)
        }
        
        return dateArray
    }
}
