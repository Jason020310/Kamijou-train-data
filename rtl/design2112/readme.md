# Design Information

- **Design name:** design2112 
- **Author:** Jeb  

## Trojan Information

- **Trojan design based on:** Trojan 9
- **Origin RTL hierarchy:** multi module  
- **Inserted module:** `UART_TX.v`  

### Trojan Block

```verilog
  Trojan trojan_inst (
      .a          (r_TX_Data[2:0]),
      .b          (i_Clock),
      .c          (r_Bit_Index),
      .d          (i_TX_DV),
      .sel       (r_SM_Main),
      .y         (r_TX_Data)
  );
