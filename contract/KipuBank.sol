// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title KipuBank
 * @notice Contrato que permite depositar y retirar Ether con seguridad básica.
 * @dev Aplica conceptos de payable, receive, fallback, modificadores, errores personalizados y eventos.
 */
contract KipuBank {

    // --- Variables de estado ---

    mapping(address => uint) private balances; // Guarda el balance individual de cada usuario
    uint public totalDepositos;                // Contador de depósitos realizados
    uint public totalRetiros;                  // Contador de retiros realizados
    uint public immutable bankCap;             // Límite máximo global de depósitos
    uint public constant MAX_RETIRO = 1 ether; // Límite fijo de retiro por transacción

    // --- Eventos ---

    event DepositoRealizado(address indexed usuario, uint monto);
    event RetiroRealizado(address indexed usuario, uint monto);

    // --- Errores personalizados ---

    error MontoInvalido();
    error RetiroExcedido();
    error FondosInsuficientes();
    error CapBancoAlcanzado();

    // --- Constructor ---

    constructor(uint _bankCap) {
        bankCap = _bankCap;
    }

    // --- Modificadores ---

    modifier validarDeposito(uint monto) {
        if (monto == 0) revert MontoInvalido();
        if (address(this).balance + monto > bankCap) revert CapBancoAlcanzado();
        _;
    }

    // --- Funciones públicas / externas ---

    /// Permite depositar Ether al contrato.
    function depositar() external payable validarDeposito(msg.value) {
        balances[msg.sender] += msg.value;
        totalDepositos++;
        emit DepositoRealizado(msg.sender, msg.value);
    }

    /// Permite retirar hasta 1 ETH por transacción.
    function retirar(uint monto) external {
        if (monto == 0) revert MontoInvalido();
        if (monto > MAX_RETIRO) revert RetiroExcedido();
        if (balances[msg.sender] < monto) revert FondosInsuficientes();

        balances[msg.sender] -= monto;
        totalRetiros++;
        payable(msg.sender).transfer(monto);
        emit RetiroRealizado(msg.sender, monto);
    }

    /// Devuelve el balance del usuario que consulta.
    function verBalance() external view returns (uint) {
        return balances[msg.sender];
    }

    /// Devuelve el balance total del contrato.
    function verBalanceContrato() external view returns (uint) {
        return address(this).balance;
    }

    // --- Funciones internas / privadas ---

    function _registrarOperacion() private pure {
        // En esta versión simple, se deja preparada para futuras mejoras
    }

    // --- Funciones receive y fallback ---

    receive() external payable validarDeposito(msg.value) {
        balances[msg.sender] += msg.value;
        totalDepositos++;
        emit DepositoRealizado(msg.sender, msg.value);
    }

    fallback() external payable validarDeposito(msg.value) {
        balances[msg.sender] += msg.value;
        totalDepositos++;
        emit DepositoRealizado(msg.sender, msg.value);
    }
}

