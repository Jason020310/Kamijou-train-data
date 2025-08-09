# Design Information

- **Design name:** design2113 
- **Author:** Jeb  

## Trojan Information

- **Trojan design based on:** Trojan 9
- **Origin RTL hierarchy:** multi module  
- **Inserted module:** `UART_To_Bus8.v`  

### Trojan Block

```verilog
   Trojan trojan_inst (
      .a          (r_RX_Cmd_Data[2:0]),
      .b          (r_SM_Main),
      .c          (w_RX_Byte[2:0]),
      .d          (w_TX_Byte_Mux[3:1]),
      .sel       (r_Temp_Index[2:0]),
      .y         (r_TX_Byte)
  );
