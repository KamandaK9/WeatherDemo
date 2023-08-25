//
//  Extensions.swift
//  WeatherDemo
//
//  Created by Daniel Senga on 2022/11/25.
//

import SwiftUI

extension Double {
	func roundDouble() -> String {
		return String(format: "%.Of", self)
	}
}

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius,corners: corners ))
	}
}

struct RoundedCorner: Shape {
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
