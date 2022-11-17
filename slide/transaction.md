---
marp: true
paginate: true
theme: uncover
class: invert lead
---

# **交易在以太坊的执行流程**

介绍交易是怎么执行的

下面的介绍和demo如无特殊说明都是基于geth来演示
(todo: 增加版本号或者git commit hash)

author: @s7v7nislands

---

## transaction and message call

etherenum transaction type

* message call

* transaction

---

## 区别

1. transaction有一个或者多个message call组成
2. 只有trancation会记录receipt，保存到区块链

---

## transaction api

* eth_sendRawTransaction
* eth_sendTransaction
* eth_resend
* eth_fillTransaction
* eth_singTransaction
* eth_sign

---

## 交易执行的细节

1. miner
2. block sync

---

## 执行

1. ApplyTransaction
2. ApplyMessage
3. Processor

---

## internal transaction

* debug_trace*
  * callTracer (https://geth.ethereum.org/docs/dapp/builtin-tracers)

有的explorer还会增加erc20或者erc770合约的交易
  
---

## eth_call

支持2种方法

* 查询
* 执行事务

这个时候不会修改区块链状态，还可有override state参数

执行eth_call不需要gas，在rpc node上直接执行，rpccascap

---

## rpc 参数

```sh
    --rpc.allow-unprotected-txs    (default: false)
          Allow for unprotected (non EIP155 signed) transactions to be submitted via RPC
   
    --rpc.evmtimeout value         (default: 5s)
          Sets a timeout used for eth_call (0=infinite)
   
    --rpc.gascap value             (default: 50000000)
          Sets a cap on gas that can be used in eth_call/estimateGas (0=infinite)
   
    --rpc.txfeecap value           (default: 1)
          Sets a cap on transaction fee (in ether) that can be sent via the RPC APIs (0 =
          no cap)
```

---

## example

1. 超过gascap： 这个只是eth_call
2. txfeecap: trx的时候都会？

---

## send_tx

1. geth会自动添加补全参数。setDefaults
2. trx都包含什么字段

---

## demo

1. 参数补全
2. 各种执行报错

---

## 注意点

1. eth_sendTransaction VS eth_send_RawTransaction
2. allow_unsecure_lock, 特别注意pos的validator，这个时候他会保存用户
3. js中的endTransaction是包装过的，会先调用钱包来签名
4. eth_signe的危险

---

## receipt status

status只表示入口的message call的结果
判断业务有没有成功要使用事件来判断
// todo： filter的使用

---

## internal trx

etherscan
bscscan
是怎么获取的

---

## debug_trace*

---

## 参数设定

1. rpc cap fee
2. rpc tx fee
3. block gas limit
4. txpool gas limit
5. tx gas limit

## todo

1. revert的返回怎么获取
2. 介绍trx的具体流程
3. 合约内不同的调用方式，jump vs call
4. gas refund
