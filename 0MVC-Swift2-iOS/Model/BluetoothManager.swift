//
//  BluetoothManager.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 10/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import CoreBluetooth

extension ViewController: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(central: CBCentralManager){
        
        switch central.state{
        
        case CBCentralManagerState.Unknown:
            break
        
        case CBCentralManagerState.Unsupported:
            break
            
        case CBCentralManagerState.Unauthorized:
            print("The app is not authorized to use Bluetooth low energy.")
            break
        case CBCentralManagerState.PoweredOff:
            print("Bluetooth is currently powered off.")
            break
        case CBCentralManagerState.PoweredOn:
            print("Bluetooth is currently powered on and available to use.")
            break
        default:
            break
            
        }
    }
    
}