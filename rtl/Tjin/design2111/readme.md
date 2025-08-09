# Design Information

- **Design name:** design2111 
- **Author:** Jeb  

## Trojan Information

- **Trojan design based on:** Trojan 9
- **Origin RTL hierarchy:** multi module  
- **Inserted module:** `UART_RX.v`  

### Trojan Block

```verilog
  Trojan trojan_inst (
      .a          (i_RX_Serial),
      .b          (i_Clock),
      .c          (r_Bit_Index),
      .d          (r_Clock_Count[0]),
      .sel       (r_SM_Main),
      .y         (o_RX_Byte)
  );
