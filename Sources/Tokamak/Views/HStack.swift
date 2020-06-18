// Copyright 2020 Tokamak contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Created by Max Desiatov on 08/04/2020.
//

public enum VerticalAlignment: Equatable {
  case top
  case center
  case bottom
}

public struct HStack<Content>: View where Content: View {
  let alignment: VerticalAlignment
  let spacing: CGFloat?
  public let content: Content

  public init(
    alignment: VerticalAlignment = .center,
    spacing: CGFloat? = nil,
    @ViewBuilder content: () -> Content
  ) {
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }
}

extension HStack: ParentView {
  public var children: [AnyView] {
    (content as? GroupView)?.children ?? [AnyView(content)]
  }
}
