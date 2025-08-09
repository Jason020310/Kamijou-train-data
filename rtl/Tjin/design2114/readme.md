# Design Information

- **Design name:** design2111 
- **Author:** Jeb  

## Trojan Information

- **Trojan design based on:** Trojan 9
- **Origin RTL hierarchy:** multi module  
- **Inserted module:** `UART_To_Bus16.v`  

### Trojan Block

```verilog
  Trojan trojan_inst (
    .a          (r_RX_Cmd_Data[3:0]),
    .b          (r_RX_Cmd_Addr[4:1]),
    .c          (w_RX_Byte[5:2]),
    .d          (w_TX_Byte_Mux[4:1]),
    .sel       (r_Temp_Index[2:1]),
    .y         (r_TX_Byte)
);
