# How to use Mermaid.

Mermaid can be used in a lot of things including flowchart, ER Diagrams, State, Maps, Architecture.

## 1. Flowcharts

Everything starts with:

```
graph TD
```

or

```
flowchart TD
```

Both are equivalent

TD -> Top down
LR -> Left right
RL -> Left right
DT -> Down Top

## 2. Nodes

Every box is called a node.

```mermaid
graph TD

A
B
C
```

Connect them with Arrows

```mermaid
graph TD

A --> B
B --> C

```

## 3. Labels

Instead of:

```
A
```

you can write:

```mermaid
graph TD

A[Main]
B[ProviderScope]

A --> B
```

## 4. Node Shapes

| Symbol | Shape              | Example           |
| :----- | :----------------- | :---------------- |
| []     | Rectangle          | A[Test]           |
| ()     | Rounded            | A(Test)           |
| ([])   | Database           | A([Test])         |
| (())   | Circle             | A((Test))         |
| {}     | Diamond            | A{Authenticated?} |
| {{}}   | Hexagon            | A{{Riverpod}}     |
| [//]   | Trapezoid          | A[/Input/]        |
| [\\\\] | Inverted Trapezoid | A[\\Output\\]     |

## 5. Arrow Types

| Symbol  | Shape         | Example       |
| :------ | :------------ | :------------ |
| -->     | Normal Arrow  | A --> B       |
| ---     | Open Arrow    | A --- B       |
| -.->    | Dotted        | A -.-> B      |
| A ==>   | Thick         | A ==> B       |
| -->\|\| | Text on arrow | A-->\|test\|B |

## 6. Multiple Connections

```mermaid
graph TD
A
B
C
D

A --> B
A --> C
A --> D
```

## 7. Chains

instead of

```
A --> B
B --> C
C --> D
```

write

```
A --> B --> C --> D
```

## 8. Multiple Nodes

```
A --> B
A --> C
A --> D
```

can become

```mermaid
graph TD
A --> B & C & D
```

## 9. Comments

```
%% is ignored
```

## 10. Subgraphs

```mermaid
graph TD

subgraph Presentation
UI
ViewModel
end

subgraph Domain
Repository
UseCase
end

UI --> ViewModel
ViewModel --> Repository

```

## Examples

```mermaid
graph TD

subgraph App

main

ProviderScope

MaterialApp

GoRouter

end

main --> ProviderScope
ProviderScope --> MaterialApp
MaterialApp --> GoRouter
```

## Decision Trees

```mermaid
graph TD
A{Logged In?}
B[Dashboard]
C[Login]

A --> |Yes| B
A --> |No| C
```

## Styling

Color one node

```
style A fill:#4caf50
```

```
style A stroke:#000
```

```
style A color:#fff
```

```
style A fill:#2196F3,stroke:#333,color:#fff
```

## Classes

```
classDef provider fill:#2196f3,color:#fff
class A provider
```

## Sequence Diagram

For API Calls

```mermaid
sequenceDiagram

User ->> UI: Tap Login
UI ->> ViewModel: login()
ViewModel ->> Repository: login()
Repository ->> API : POST /login
API ->> Repository: Token
Repository ->> ViewModel : Success
ViewModel ->> UI: Navigate
```

## Class Diagram

```mermaid
classDiagram

class User

class Repository

User --> Repository
```

## ER Diagram

Database

```mermaid
erDiagram

User ||--o{ POST : creates

User {
  int id
  string name
}

POST {
  int id
  string title
}

```

## State Diagram

```mermaid
stateDiagram-v2
Loading --> Success
Loading --> Error
Success --> Refreshing
```

## Mindmap

```mermaid
mindmap
  root((Flutter))

    Riverpod

    GoRouter

    Freezed

    SQLite
```

## Architecture Diagram (new)

```mermaid
architecture-beta

group app

service ui

service api

ui:R --> L:api
```

## Project Example

```mermaid
graph TD

main["main()"]

binding["WidgetsFlutterBinding"]

provider["ProviderScope"]

app["App"]

router["MaterialApp.router"]

go["GoRouter"]

home["Dashboard"]

main --> binding

binding --> provider

provider --> app

app --> router

router --> go

go --> home
```
