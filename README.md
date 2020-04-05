![](http://media.charlesleifer.com/blog/photos/logo.png)

Fast bindings to kyototycoon and tokyotyrant.

* Binary APIs implemented as C extension.
* Thread-safe and greenlet-safe.
* Simple APIs.
* Full-featured implementation of protocol.

View the [documentation](http://kt-lib.readthedocs.io/en/latest/) for more
info.

#### installing

```console

$ pip install kt
```

#### usage

```pycon

>>> from kt import KyotoTycoon
>>> client = KyotoTycoon()
>>> client.set('k1', 'v1')
1
>>> client.get('k1')
'v1'
>>> client.remove('k1')
1

>>> client.set_bulk({'k1': 'v1', 'k2': 'v2', 'k3': 'v3'})
3
>>> client.get_bulk(['k1', 'xx, 'k3'])
{'k1': 'v1', 'k3': 'v3'}
>>> client.remove_bulk(['k1', 'xx', 'k3'])
2
```

## Remark
- 网络部分采用Py2的httplib标准库(Py3中该库重命名为http.client),支持丰富的API接口(例如set、get、set_bulk、get_bulk)，包括其他复杂的API接口(例如游标类的jump、step等)
- value支持6种形式的序列化方式，包括pickle和json，默认采用binary序列化
- x.kct#opts=1#rcomp=lexdesc#bnum=1000000#msize=1g#dfunit=8,set性能在15000qps左右,get性能在16000qps左右,match_regex性能在2500qps左右
