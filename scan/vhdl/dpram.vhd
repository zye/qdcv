--
-- Dual-Port RAM with Enable on Each Port
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;


--pragma translate_off
library UNISIM;
use UNISIM.vcomponents.all;
--pragma translate_on


entity dpram is
  generic(
    DWIDTH : natural := 32;
    SIZE : natural := 64;
    AWIDTH : natural := 6
    );
    port (clk : in std_logic;
          ena : in std_logic;
          enb : in std_logic;
          wea : in std_logic;
          addra : in std_logic_vector(AWIDTH-1 downto 0);
          addrb : in std_logic_vector(AWIDTH-1 downto 0);
          dia : in std_logic_vector(DWIDTH-1 downto 0);
          doa : out std_logic_vector(DWIDTH-1 downto 0);
          dob : out std_logic_vector(DWIDTH-1 downto 0));
end dpram;
architecture syn of dpram is
  type DPRAM is array (0 to SIZE-1) of std_logic_vector (DWIDTH-1 downto 0);
  signal RAM : DPRAM;
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";  -- Xilinx RAM_STYLE
  signal read_addra : std_logic_vector(AWIDTH-1 downto 0);
  signal read_addrb : std_logic_vector(AWIDTH-1 downto 0);
begin
  rw: process (clk)
  begin
    if clk'event and clk = '1' then
      if ena = '1' then
        if wea = '1' then
          RAM (CONV_INTEGER(addra)) <= dia;
        end if;
        read_addra <= addra;
      end if;
      if enb = '1' then
        read_addrb <= addrb;        
      end if;      
    end if;
  end process;
  doa <= RAM(CONV_INTEGER(read_addra));
  dob <= RAM(CONV_INTEGER(read_addrb));
end syn;
