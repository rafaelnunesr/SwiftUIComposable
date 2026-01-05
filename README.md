# SwiftUIComposable — `solution/v1`

📌 **Branch:** `solution/v1`  
🛠️ **Purpose:** Study-focused exploration of composable SwiftUI views

---

## 📖 Overview

This branch is a **study project focused on understanding how to compose SwiftUI views in a simple and flexible way**. The goal is not to present a production-ready architecture, but rather to explore patterns that make view composition easier to reason about, extend, and experiment with.

The main idea explored here is **section-based composition**, where screens are built by assembling smaller, self-contained section views. These section views are wrapped using `AnyView` and later composed into higher-level views such as `FruitsView` and `FoodView`.

---

## 🎯 Core Idea

SwiftUI encourages composition, but it becomes challenging when:

- You want to store multiple view types in a single collection
- You want to dynamically assemble screens from heterogeneous sections

This branch studies a solution based on:

- A **`SectionView`** protocol that all section views conform to
- **Type erasure using `AnyView`** to store different section views together
- A **`SectionGroupView`** that composes and renders these sections

---

## 🧩 Section-Based Composition

Each part of the UI is modeled as a *section*:

- A section is responsible for its own layout and content
- Sections are reusable across different screens
- Screens become simple compositions of sections rather than large monolithic views

  

Examples of composed screens include:

- `FruitsView`
- `FoodView`

Each of these views is created by assembling a list of section views.

---

## 📐 `SectionView` Protocol

All section views conform to a common protocol, conceptually similar to:

```swift
protocol SectionView: View, Identifiable {
    var id: UUID { get }
    func refresh()
}
```


Key points:

- Every section provides its own SwiftUI view

- The protocol gives all sections a shared interface

- This makes it possible to treat all sections uniformly, even though their internal views differ

## 📦 Type Erasure with AnyView

SwiftUI views have concrete types, which makes it difficult to store different views in a single array.

To solve this, each section’s view is wrapped using `AnyView`:

Enables storing heterogeneous views in a collection

Allows dynamic composition of sections

Simplifies the container logic

⚠️ This approach intentionally uses `AnyView` as a learning tool. While it introduces some trade-offs (such as loss of type information), it keeps the composition logic easy to understand for study purposes.

## 🗂️ Key File: SectionGroupView.swift

SectionGroupView.swift is the central piece of this approach.

#### Responsibilities:

- Holds a collection of section views wrapped in AnyView

- Iterates over and renders each section

- Acts as the bridge between individual section implementations and the final screen

In practice, it works as a reusable container that knows how to display sections, without needing to know what each section contains.

## 🧱 Example Composition
#### Creating Sections

```swift
    private func buildAppleSection() -> some SectionView {
        let router = AppleRouter()
        let interactor = AppleInteractor(id: "apple_id")
        let viewModel = AppleSectionViewModel(interactor: interactor, router: router)
        return AppleSectionView(viewModel: viewModel)
    }
    
    private func buildBananaSection() -> some SectionView {
        let router = BananaRouter()
        let interactor = BananaInteractor(id: "banana_id")
        let viewModel = BananaSectionViewModel(interactor: interactor, router: router)
        return BananaSectionView(viewModel: viewModel)
    }

    func buildFruitsView() -> some View {
        let appleSection = buildAppleSection()
        let bananaSection = buildBananaSection()
        
        let sectionGroupView = SectionGroupView(sections: [appleSection, bananaSection])
        
        let viewModel = FruitsViewModel()
        return FruitsView(viewModel: viewModel, sectionGroup: sectionGroupView)
    }
```

This keeps screens lightweight and focused purely on composition.

## ✅ Why This Approach?

#### Learning-Oriented
Designed to study SwiftUI composition patterns without architectural complexity.

#### Readable & Modular
Screens are built from clear, reusable pieces.

#### Flexible Assembly
Sections can be reordered, reused, or replaced with minimal effort.

## ⚠️ Notes & Limitations

AnyView erases type information, which may affect SwiftUI’s diffing and performance.


This branch represents a practical study of SwiftUI composition, emphasizing clarity, modularity, and experimentation over optimization.
