# Command
```json
["-p1", "{ios_project_1}", "-p2", "{ios_project_2}", "-g", "resources", "-f", "json"]
```

# Expected exit code
1

# Expected output
```
[
  {
    "context" : [
      "\"Project\" target"
    ],
    "differentValues" : [

    ],
    "onlyInFirst" : [
      "Project\/Group B\/AViewController.xib",
      "Project\/Resources\/time.png"
    ],
    "onlyInSecond" : [

    ],
    "tag" : "resources"
  },
  {
    "context" : [
      "\"ProjectFramework\" target"
    ],
    "differentValues" : [

    ],
    "onlyInFirst" : [

    ],
    "onlyInSecond" : [

    ],
    "tag" : "resources"
  },
  {
    "context" : [
      "\"ProjectTests\" target"
    ],
    "differentValues" : [

    ],
    "onlyInFirst" : [

    ],
    "onlyInSecond" : [
      "ProjectTests\/Responses\/ListResponse.json"
    ],
    "tag" : "resources"
  },
  {
    "context" : [
      "\"ProjectUITests\" target"
    ],
    "differentValues" : [

    ],
    "onlyInFirst" : [
      "ProjectUITests\/Screenshots\/empty.png"
    ],
    "onlyInSecond" : [

    ],
    "tag" : "resources"
  }
]

```