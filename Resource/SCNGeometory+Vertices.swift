//
//  SCNGeometory+Vertices.swift
//  SCNReplicatorNode
//
//  Created by Toshihiro Goto on 2018/03/30.
//  Copyright © 2018年 Toshihiro Goto. All rights reserved.
//

import UIKit
import SceneKit

extension SCNGeometry {
    func vertices() -> [SCNVector3] {

        var vectors = [SCNVector3]()
        
        let vertexSources = sources(for: .vertex)
        if let v = vertexSources.first {
            v.data.withUnsafeBytes { (p: UnsafePointer<Float32>) in
                for i in 0..<v.vectorCount {
                    let index = (i * v.dataStride + v.dataOffset) / 4
                    vectors.append(SCNVector3Make(
                        p[index + 0],
                        p[index + 1],
                        p[index + 2]
                    ))
                }
            }
            return vectors
        }
        
        return []
    }
    
    func normals() -> [SCNVector3] {
        
        var vectors = [SCNVector3]()
        
        let normalSources = sources(for: .normal)
        if let v = normalSources.first {
            v.data.withUnsafeBytes { (p: UnsafePointer<Float32>) in
                for i in 0..<v.vectorCount {
                    let index = (i * v.dataStride + v.dataOffset) / 4
                    vectors.append(SCNVector3Make(
                        p[index + 0],
                        p[index + 1],
                        p[index + 2]
                    ))
                }
            }
            return vectors
        }
        
        return []
    }
}
