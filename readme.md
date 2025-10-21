# 🏦 KipuBank - Contrato Inteligente en Solidity

## Descripción General

**KipuBank** es un contrato inteligente simple desarrollado en **Solidity (v0.8.20)** que permite a los usuarios **depositar y consultar Ether** almacenado en una bóveda personal dentro de la blockchain.

Este ejercicio corresponde al **Examen del Módulo 2** del curso Web3 y tiene como objetivo aplicar los conocimientos fundamentales sobre contratos inteligentes, estructura limpia de código y documentación profesional.

Aunque este proyecto no implementa todas las funciones avanzadas solicitadas (como límites globales o umbrales de retiro), constituye una **base sólida y coherente** para continuar el desarrollo progresivo del contrato a lo largo de los siguientes módulos.



##  Funcionalidad Principal

El contrato permite:

- Depositar Ether mediante una función `depositar()` o mediante llamadas directas al contrato (`receive` y `fallback`).
- Consultar el balance personal del usuario (`verBalance()`).
- Consultar el balance total del contrato (`verBalanceContrato()`).
- Emitir eventos cada vez que un usuario deposita fondos.

El contrato mantiene un **registro de balances individuales** mediante un `mapping`.



##  Estructura del Repositorio


kipu-bank/

│
├──contracts/
               
            └──KipuBank.sol

│
├──README.md




## Instrucciones de Despliegue

### En Remix (recomendado para pruebas)
1. Ir a [Remix IDE](https://remix.ethereum.org/).  
2. Crear un nuevo archivo en la carpeta `contracts` y pegar el código de `KipuBank.sol`.  
3. Seleccionar compilador **0.8.20**.  
4. Compilar el contrato.  
5. En la pestaña **Deploy & Run Transactions**:
   - Seleccionar el entorno **- MetaMask** o **Remix VM**.  
   - Desplegar el contrato sin parámetros (`Deploy`).  


### En Testnet (Goerli, Sepolia, etc.)
- Conectar MetaMask a la red de prueba.  
- Obtener ETH de un faucet.  
- Desplegar desde Remix o Hardhat.  
- Verificar el contrato en un explorador como [Etherscan](https://sepolia.etherscan.io/).



## 🧪 Interacción y Pruebas

| Acción | Descripción | Método |
|--------|--------------|--------|
| **Depositar Ether** | Envía ETH al contrato y guarda el monto en tu balance personal. | `depositar()` (payable) |
| **Ver balance personal** | Consulta cuánto Ether has depositado. | `verBalance()` |
| **Ver balance total del contrato** | Muestra todo el ETH almacenado en KipuBank. | `verBalanceContrato()` |
| **Enviar ETH directamente** | Puedes enviar ETH al contrato sin llamar a funciones. Se activará `receive` o `fallback`. | `receive()` / `fallback()` |

Ejemplo en consola de Remix:


// Depositar 1 ether
await kipuBank.depositar({ value: ethers.utils.parseEther("1.0") })

// Ver balance del usuario
(await kipuBank.verBalance()).toString()


### En Testnet (Sepolia)
- Conectar MetaMask a la red de prueba.  
- Obtener ETH de un faucet.  
- Desplegar desde Remix o Hardhat.  
- Verificar el contrato en un explorador como [Etherscan](https://sepolia.etherscan.io/).



## 🧪 Interacción y Pruebas

| Acción | Descripción | Método |
|--------|--------------|--------|
| **Depositar Ether** | Envía ETH al contrato y guarda el monto en tu balance personal. | `depositar()` (payable) |
| **Ver balance personal** | Consulta cuánto Ether has depositado. | `verBalance()` |
| **Ver balance total del contrato** | Muestra todo el ETH almacenado en KipuBank. | `verBalanceContrato()` |
| **Enviar ETH directamente** | Puedes enviar ETH al contrato sin llamar a funciones. Se activará `receive` o `fallback`. | `receive()` / `fallback()` |

Ejemplo en consola de Remix:


// Depositar 1 ether
await kipuBank.depositar({ value: ethers.utils.parseEther("1.0") })

// Ver balance del usuario
(await kipuBank.verBalance()).toString()
