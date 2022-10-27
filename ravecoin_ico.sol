// SDP-License-Identifier: GPL-3.0
// Version of compiler
pragma solidity ^0.5.0;

contract ravecoin_ico {

    // Imprimindo o número máximo de ravecoins à venda
    uint public max_ravecoins = 1000000000;   //aumento do valor máximo para satisfazer modifier can_buy_ravecoins

    // Imprimindo a taxa de conversão de USD para ravecoins
    uint public usd_to_ravecoins = 14177845;    //NUSP como taxa de conversão 

    // Imprimindo o número total de ravecoins que foram comprados por investidores
    uint public total_ravecoins_bought = 0;

    // Mapeamento do endereço do investidor para seu patrimônio em ravecoins para USD
    mapping(address => uint) equity_ravecoins;
    mapping(address => uint) equity_usd;

    // Verificando se um investidor pode comprar ravecoins
    modifier can_buy_ravecoins(uint usd_invested) {
        require (usd_invested * usd_to_ravecoins + total_ravecoins_bought <= max_ravecoins); 
        _;
    }

    // Obtendo o patrimônio em ravecoins de um investidor
    function equity_in_ravecoins(address investor) external view returns (uint) {
        return equity_ravecoins[investor];
    }

    // Obtendo o patrimônio em dólares de um investidor
    function equity_in_usd(address investor) external view returns (uint) {
        return equity_usd[investor];
    }

    // Comprando ravecoins
    function buy_ravecoins(address investor, uint usd_invested) external
    can_buy_ravecoins(usd_invested) {
        uint ravecoins_bought = usd_invested * usd_to_ravecoins;
        equity_ravecoins[investor] += ravecoins_bought;
        equity_usd[investor] = equity_ravecoins[investor] / usd_to_ravecoins;
        total_ravecoins_bought += ravecoins_bought;
    }

    // Verificando se um investidor possui saldo para vender em ravecoins
    /*
    modifier can_sell_ravecoins(address investor, uint ravecoins_sold) {
        require (0 < ravecoins_sold);
        _;
        require (ravecoins_sold <= equity_ravecoins[investor]);
        _;
    }
    */

    // Verificar se um investidor possui saldo para vender em ravecoins 
    modifier can_sell_ravecoins(address investor, uint ravecoins_sold){
      require(equity_ravecoins[investor]>=ravecoins_sold, "saldo da conta insuficiente");
      _;  
    }

    // Vendendo ravecoins
    function sell_ravecoins(address investor, uint ravecoins_sold) external
    can_sell_ravecoins(investor, ravecoins_sold) {
        equity_ravecoins[investor] -= ravecoins_sold;
        equity_usd[investor] = equity_ravecoins[investor] / usd_to_ravecoins;
        total_ravecoins_bought -= ravecoins_sold;
        
    }

    
}
