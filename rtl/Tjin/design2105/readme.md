# Design Information

- **Design name:** design2105  
- **Author:** Jeb  

## Trojan Information

- **Trojan design based on:** Trojan 5  
- **Origin RTL hierarchy:** Single module  
- **Inserted module:** `syncfifo.v`  

### Trojan Block

```verilog
Trojan trojan_inst (
    .rst  (reset),
    .arr1 (data_in),
    .arr2 (count),
    .out  (out[3:0])
);
