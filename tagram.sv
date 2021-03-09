module tagram(clk,we,re,waddr,raddr,hit,miss);
  
  parameter WIDTH=64;
  parameter BLOCK=8;
  parameter TAG=4;
  localparam DEPTH=1<<TAG;
  reg [2:0]tag_addr;
  reg [2:0]tag_mem[DEPTH-1:0]
  
  input we,clk,re;
  input reg [BLOCK-1:0]waddr,raddr;
  output reg hit,miss;
  wire [TAG-1:0]taddr,raddr;
  
  assign taddr=waddr[DEPTH-1:0];
  assign trddr=raddr[DEPTH-1:0];
  
  always @(posedge clk)begin
    if(we)
      tag_mem[taddr]<=#1 waddr[7:5];
  end
  
  always @(*) begin
    tag_addr=0;
    if(re)
      tag_addr=tag_mem[trddr];
  end
  
  always @(*)begin
    hit=0;
    miss=0;
    if(re)begin
      if(tag_addr=raddr[DEPTH-1:12])begin
        $display("Its is a hit");
        hit=1;
      end else begin
        $display("Its is a Miss");
       miss=1; 
      end
    end
  end
  
endmodule
