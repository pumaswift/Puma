//
//  IncreaseBuildNumberTask.swift
//  Puma
//
//  Created by khoa on 16/04/2019.
//

import Foundation
import PumaCore

public class IncreaseBuildNumber: UsesCommandLine {
    public var program: String { "agvtool" }
    public var arguments = [String]()

    public init(_ closure: (IncreaseBuildNumber) -> Void = { _ in }) {
        closure(self)
    }

    public func run(workflow: Workflow, completion: TaskCompletion) {
        run(workflow: workflow, completion: completion, job: {
            try runCommand()
        })
    }
}

extension IncreaseBuildNumber: Task {
    public var name: String { "Increase build number" }
}

public extension IncreaseBuildNumber {
    func nextVersionForAllTargets() {
        arguments.append("next-version")
        arguments.append("-all")
    }
}
