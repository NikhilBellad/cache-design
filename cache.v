module cache(clk,we,re,waddr,raddr,din,dout);
parameter WIDTH=64;
parameter ASIZE=4;

input clk,we,re;
input [WIDTH-1:0]din;
input [DEPTH-1:0]waddr,raddr;

output [WIDTH-1:0]dout;

assign rd=(re&HIT);

sram s1(.clk(clk),
        .we(we),
        .re(re),
        .d_write(din),
        .d_read(dout),
        .waddr(waddr),
        .raddr(raddr));
        
tagram t1(.clk(clk),
          .we(we),
          .re(re),
          .waddr(waddr),
          .raddr(raddr),
          .hit(HIT),
          .miss(MISS));

endmodule

`include "sram.sv"
`include "tagram.sv"
