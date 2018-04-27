### 数据库有级联关系的转为树形结构的JSON

数据库原数据示例

```coffeeScript
citys = [
  {
    id:1,
    name:"中国",
    parent:null
  },
  {
    id:2,
    name:"陕西省",
    parent:1
  },
  {
    id:3,
    name:"宝鸡市",
    parent:2
  },
  {
    id:4,
    name:"陇县",
    parent:3
  },
  {
    id:5,
    name:"四川省",
    parent:1
  },
  {
    id:6,
    name:"成都市",
    parent:5
  },
  {
    id:7,
    name:"河南省",
    parent:1
  },
  {
    id:8,
    name:"美国",
    parent:null
  },
  {
    id:9,
    name:"洛杉矶",
    parent:8
  },
]
```


使用递归
```coffeeScript

//初始化一个超父级，数据库下所有数据都是它的子级
result = [{value:null,label:'all',children:[]}]
//定义已转化0条数据
total = 0
cl = result

//递归方法
getK = (p)->
  for k in p
    for city,index in citys when k.value is city.parent
      k.children.push({value:city.id,label:city.name,children:[]})
      total++
    getK(k.children)

//转化条数等于数据库数据总数的时候结束递归
getK(cl) until total == citys.length
```


转换后
```coffeeScript
result = [
  {
    "value": 1,
    "label": "中国",
    "children": [
      {
        "value": 2,
        "label": "陕西省",
        "children": [
          {
            "value": 3,
            "label": "宝鸡市",
            "children": [
              {
                "value": 4,
                "label": "陇县",
                "children": []
              }
            ]
          }
        ]
      },
      {
        "value": 5,
        "label": "四川省",
        "children": [
          {
            "value": 6,
            "label": "成都市",
            "children": []
          }
        ]
      },
      {
        "value": 7,
        "label": "河南省",
        "children": []
      }
    ]
  },
  {
    "value": 8,
    "label": "美国",
    "children": [
      {
        "value": 9,
        "label": "洛杉矶",
        "children": []
      }
    ]
  }
]
```


