module sram(clk,we,re,d_write,d_read,waddr,raddr);
  
parameter WIDTH=64;
parameter ASIZE=4;
  
localparam DEPTH=1<<ASIZE;

  
input we,re,clk;
input [DEPTH-1:0]raddr,waddr;
input [WIDTH-1:0]d_write;
  output reg [WIDTH-1:0]d_read;
  wire [ASIZE-1:0]taddr,trddr;
  
  assign taddr=waddr[DEPTH-1:12];
  assign trddr=raddr[DEPTH-1:12];
  
  reg [WIDTH-1:0]mem[DEPTH-1:0];
  
  always @(posedge clk)begin
    if(we)
      mem[taddr]<=d_write;
  end
  
  always @(*)begin
    if(re)
      d_read=mem[trddr];
  end
endmodule
