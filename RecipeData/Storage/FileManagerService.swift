//
//  FileManagerService.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/27/24.
//

import Foundation

class FileManagerService {

    static let shared = FileManagerService()

    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    func createDirectory(named name: String) -> URL? {
        let directory = documentsDirectory.appendingPathComponent(name)

        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
            return directory
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func writeFile(named name: String, in directory: URL, data: Data) -> URL? {
        let fileUrl = directory.appendingPathComponent(name)

        do {
            try data.write(to: fileUrl)
            return fileUrl
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func readFile(named name: String, in directory: URL) -> Data? {
        let fileUrl = directory.appendingPathComponent(name)

        do {
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func getDirectory(named name: String) -> URL? {
        let directory = documentsDirectory.appendingPathComponent(name)
        return directory
    }
}
