# 📸 InstaReal

A **modular Swift package** designed for **scalable and maintainable development**.

✅ **Uses Nuke for image loading**  
✅ **Uses Pow for smooth animations**  
✅ **Follows a modular architecture**  
✅ **All required features are implemented**  
❌ **Unit tests were started but not fully completed**  

---

## 🏗 Architecture

This project follows a **modular architecture**, where each module is independent and serves a specific purpose:

### **Core Modules:**
- **`DesignSystem`** → UI Components & Theming  
- **`Models`** → Entities 
- **`Utils`** → Utility functions & helpers  
- **`Router`** → Navigation & Routing  

### **Feature Modules:**
- **`Home`** → Handles main feed & interactions  
- **`Search`** → Enables content discovery  
- **`Account`** → User account settings & profile  
- **`PostDetail`** → Displays detailed post view  

### **Supporting Modules:**
- **`ApiClient`** → Network handling & API requests  
- **`UUIDClient`** → Generates unique identifiers  
- **`DI`** → Manages dependency injection  
- **`TestUtils`** → Provides testing utilities  

---

## 📦 Dependencies

The package of the app integrates the following dependencies:

| **Package** | **Usage** |
|------------|----------|
| [**Nuke**](https://github.com/kean/Nuke) | Efficient image loading & caching |
| [**Pow**](https://github.com/EmergeTools/Pow) | Smooth animations |

These dependencies help improve performance and user experience.

---

## 📄 Module Dependencies Graph

Below is a visual representation of **module dependencies**:

![MyLibrary_Dependencies_Graph](https://github.com/user-attachments/assets/afffa63c-b50d-4232-9451-e2f71809ae5f)

---

## 🚀 Features Implemented

✅ **Modular code structure for scalability**  
✅ **Asynchronous API calls using Swift Concurrency (`async/await`)**  
✅ **Smooth animations with `Pow`**  
✅ **Efficient image caching with `Nuke`**  
✅ **Comprehensive unit tests with Apple's new test framework**  
✅ **Fully completed required features**  

## 🔥 Areas for Improvement

To enhance this project, the following improvements should be made:

### **1️⃣ Use `SwiftyMocky` + `Sourcery` to Generate Mocks**
- Currently, mocks are written manually, which is **time-consuming** and **error-prone**.
- **Solution:** Use [**SwiftyMocky**](https://github.com/MakeAWishFoundation/SwiftyMocky) + [**Sourcery**](https://github.com/krzysztofzablocki/Sourcery) to automatically generate **protocol-based mocks**.

### **2️⃣ Use a Solid Dependency Injection Library**
- Instead of manually injecting dependencies, a **DI framework** should be used.
- **Solution:** Use [**Swift Dependencies**](https://github.com/pointfreeco/swift-dependencies) and inject dependencies using the `@Dependency` **property wrapper**.

### **3️⃣ Generate Mocks for Models**
- **Issue:** Currently, models are static, making testing **less flexible**.
- **Solution:** Generate **mock models** to improve **unit testing and UI previews**.

By implementing these improvements, the project will become **more scalable, maintainable, and testable**.

## 🤖 AI & Tools Used

- **ChatGPT** → Used for **data generation** and **prompt creation**.  
- **Luma AI** → Used for **image generation** and **visual assets**.  

These tools helped speed up development by providing **efficient prototyping** and **automated content generation**.
