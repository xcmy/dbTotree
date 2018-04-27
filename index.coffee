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

#console.log(JSON.stringify(citys,null,2))

result = [{value:null,label:'all',children:[]}]
total = 0
cl = result

getK = (p)->
  for k in p
    for city,index in citys when k.value is city.parent
      k.children.push({
        value:city.id,
        label:city.name,
        children:[]
      })
      total++
    getK(k.children)

getK(cl) until total == citys.length

console.log('total======>'+total)

console.log(JSON.stringify(result[0]['children'],null,2))
