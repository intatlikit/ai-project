---
name: json-to-kotlin
description: >
  Convert any JSON object or JSON schema into Kotlin data classes. Use this skill whenever
  the user pastes JSON and wants Kotlin data classes, asks to "convert JSON to Kotlin",
  "generate Kotlin model from JSON", "make a data class from this JSON", or wants Kotlin
  POJOs/models from a JSON payload or API response. Always trigger this skill when JSON
  conversion to Kotlin is involved, even if the request is casual ("can you make a Kotlin
  class for this?").
---

# JSON/Schema → Kotlin Data Class Skill

Convert JSON or JSON Schemas into idiomatic Kotlin data classes using these **optimized rules**:

## 🛠 Core Constraints

| Category | Rule |
|---|---|
| **Nullability** | **All fields MUST be optional**: Use `?` nullable type with default `= null`. |
| **Annotations** | **Strict `@SerializedName`**: Always annotate every property, even if names match. |
| **Imports** | Always include `import com.google.gson.annotations.SerializedName`. |
| **Nesting** | **Encapsulated Classes**: All nested objects MUST be defined as `data class` members **inside** the parent class body. |
| **Naming** | **Class**: PascalCase. **Property**: camelCase. **Arrays**: Must end with `List` (e.g., `userList`). |
| **Exclusions** | **Ignore Specific Fields**: Always omit `headerResp` and `headerReq` from the generated code. |

---

## 📋 Type Mapping

| JSON / Schema Type | Kotlin Type | Logic |
|---|---|---|
| `string` | `String?` | Standard string. |
| `integer` | `Int?` | Use `Long?` only if value exceeds `2,147,483,647`. |
| `number` | `Double?` | Default for any numeric field with decimals. |
| `boolean` | `Boolean?` | Standard boolean. |
| `object` | `ClassName?` | Creates a nested `data class`. |
| `array` (objects) | `List<ClassName>?` | Property name: `keyNameList`. Class: `KeyName`. |
| `array` (primitives) | `List<Type>?` | e.g., `List<String>?`, `List<Int>?`. |
| `null` / `any` | `Any?` | Include a `// TODO: Define type` comment. |

---

## 🏗 JSON Schema Specifics

When a **JSON Schema** is provided, map these keywords:
- `properties`: Each key becomes a class property.
- `items`: Defines the type for an `array`.
- `type`: Maps to the Kotlin types above.
- `enum`: Generate as a `String?` with a comment listing the allowed values.
- `required`: **Ignore for nullability** (keep all fields `? = null` per user preference) but you may add a `// Required field` comment.

---

## ✍️ Generation Template

```kotlin
import com.google.gson.annotations.SerializedName

data class RootClass(
    @SerializedName("id") val id: Int? = null,
    @SerializedName("meta_data") val metaData: MetaData? = null,
    @SerializedName("tags") val tagList: List<String>? = null
) {
    data class MetaData(
        @SerializedName("created_at") val createdAt: String? = null
    )
}
```

---

## 🧪 Examples

### Input: JSON
```json
{
  "user_info": { "id": 1 },
  "tags": ["admin", "pro"]
}
```

### Output: Kotlin
```kotlin
import com.google.gson.annotations.SerializedName

data class Response(
    @SerializedName("user_info") val userInfo: UserInfo? = null,
    @SerializedName("tags") val tagList: List<String>? = null
) {
    data class UserInfo(
        @SerializedName("id") val id: Int? = null
    )
}
```

---

## ⚠️ Edge Case Handling

- **Duplicate Names**: If two different nested objects have the same key name but different structures, suffix the class names (e.g., `Address`, `WorkAddress`).
- **Empty Structures**: For `{}` or `[]`, use `Any?` or `List<Any>?` with an explanatory comment.
- **Root Array**: If the root is `[...]`, name the class `Item` and suggest usage as `List<Item>`.

---

## 📢 Post-Generation Notes
*Always include this at the very end:*

> **Setup Required:**
> 1. Add Gson to `build.gradle`: `implementation 'com.google.code.gson:gson:2.10.1'`
> 2. For Android, consider adding `@Parcelize` if the models are passed between Activities.
