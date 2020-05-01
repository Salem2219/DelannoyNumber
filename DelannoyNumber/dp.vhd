library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, wr, i_ld, j_ld, sel : in std_logic;
    n, m : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    y : out std_logic_vector(31 downto 0));
end dp;

architecture rtl of dp is
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component ram is
port(clk, wr : in std_logic;
i, j, m, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(31 downto 0));
end component;
signal i, i_in, iplus1, j, j_in, jplus1 :  std_logic_vector(3 downto 0);
begin
    i_op : plus1 port map (i, iplus1);
    i_mux : mux4 port map (sel, "0001", iplus1, i_in);
    i_reg : reg4 port map (clk, rst, i_ld, i_in, i);
    j_op : plus1 port map (j, jplus1);
    j_mux : mux4 port map (sel, "0001", jplus1, j_in);
    j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
    in_comp : compgr port map (i, m, x1);
    jm_comp : compgr port map (j, n, x2);
    dp_ram : ram port map (clk, wr, i, j, m, n, y);
end rtl;

