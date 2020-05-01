library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr : in std_logic;
i, j, m, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(31 downto 0));
end ram;
architecture rtl of ram is
type ram_type is array (0 to 15, 0 to 15) of
std_logic_vector(31 downto 0) ;
signal program: ram_type:= (others => (others => "00000000000000000000000000000001"));
signal iminus1, jminus1 : std_logic_vector(3 downto 0);
signal dp1, dp2, add, dp1plusdp2, dp3 : std_logic_vector(31 downto 0);

component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component adder is
    port (a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;

begin
u1 : minus1 port map (i, iminus1);
u2 : minus1 port map (j, jminus1);
u3 : adder port map (dp1, dp2, dp1plusdp2);
u4 : adder port map (dp1plusdp2, dp3, add);
dp1 <= program(conv_integer(unsigned(iminus1)), conv_integer(unsigned(j)));
dp2 <= program(conv_integer(unsigned(iminus1)), conv_integer(unsigned(jminus1)));
dp3 <= program(conv_integer(unsigned(i)), conv_integer(unsigned(jminus1)));
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(i)), conv_integer(unsigned(j))) <= add;
end if;
end if;
end process;
y <= program(conv_integer(unsigned(m)), conv_integer(unsigned(n)));
end rtl;