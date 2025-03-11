// Copyright © InstaReal. All rights reserved.

import SwiftUI

public extension View {

    func infinite(alignmment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignmment)
    }
    
    func cornerRadius(_ cornerRadius: Radius) -> some View {
        clipShape(RoundedRectangle(cornerRadius: cornerRadius.value))
    }

    func cornerRadius(_ cornerRadius: Radius, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(cornerRadius: cornerRadius.value, corners: corners))
    }

    func padding(_ edges: Edge.Set = .all, _ space: Space) -> some View {
        self.padding(edges, space.value)
    }

    func padding(_ space: Space) -> some View {
        self.padding(space.value)
    }

    func padding(horizontal: Space, vertical: Space) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }

    func padding(
        top: Space = .none,
        leading: Space = .none,
        bottom: Space = .none,
        trailing: Space = .none
    ) -> some View {
        self.padding(EdgeInsets(
            top: top.value,
            leading: leading.value,
            bottom: bottom.value,
            trailing: trailing.value
        ))
    }
}

private struct RoundedCorner: Shape {

    private var cornerRadius: CGFloat
    private var corners: UIRectCorner

    init(cornerRadius: CGFloat, corners: UIRectCorner) {
        self.cornerRadius = cornerRadius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}
