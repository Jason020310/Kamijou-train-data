Trojan based: 計數器觸發的資料外洩 (Counter-triggered Information Leak)



Trigger: 當「啟動事件」(寫入位址 0x0) 的總次數超過 5 次後觸發。



Payload: 當軟體讀取狀態暫存器 (位址 0x1) 時，電路偷偷回傳「停止指令暫存器」(位址 0x2) 的內容



Insert module: design2302.v

