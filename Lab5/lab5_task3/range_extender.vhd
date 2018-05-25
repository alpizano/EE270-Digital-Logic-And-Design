library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity range_extender is
	generic( M,N : positive:= 1;
	P,Q : natural:= 3 );
	port(
	arith, dim: in std_logic;
	x: in std_logic_vector((N+M-1) downto 0);
	y: out std_logic_vector((N+M+P+Q-1) downto 0)
	);
end entity range_extender;

architecture behavior of range_extender is
	signal int_ext_bit,unsign_int : std_logic_vector(( P - 1) downto 0);
	signal frac_ext_bit : std_logic_vector((Q - 1) downto 0);
	signal t : std_logic;
	
begin
t<='1';
	extender : process (arith, dim,unsign_int,int_ext_bit,frac_ext_bit,x,y,t) is begin
	unsign : for i in (p - 1) downto 0 loop 
	unsign_int(i) <= ('0' and x(N + M-1));
	end loop unsign;
	int : for i in (p - 1) downto 0 loop 
	int_ext_bit(i) <= (t and x ((N + M)- 1));
	end loop int;
	if(arith='0') then y <= (unsign_int & x & frac_ext_bit);
	elsif(arith <= '1' and dim <= '0') then y <= (int_ext_bit & x & frac_ext_bit);
	else y <= (int_ext_bit & x & frac_ext_bit);
	end if;
	frac : for i in (p-1) downto 0 loop 
	frac_ext_bit(i) <= ('0' and x ( N + M - 1));
	
end loop frac;

end process extender;

end architecture behavior;