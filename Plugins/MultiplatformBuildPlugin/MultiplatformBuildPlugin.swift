// https://github.com/marty-suzuki/kmm-with-spm-buildtoolplugin-sample/

import PackagePlugin
import Foundation

@main
struct MultiplatformBuildPlugin: BuildToolPlugin {
	func createBuildCommands(
		context: PluginContext,
		target: Target
	) async throws -> [Command] {
		let projectRoot = context.package.directory.appending(["..", ".."])
		let executable = projectRoot.appending(["make"])

		return try target.sourceFiles.filter{ $0.path.filename == "Makefile" }.map {
			let outputName = $0.path.stem + ".xcframework"
			let outputPath = context.pluginWorkDirectory.appending(outputName)
			return [
				.prebuildCommand(
					displayName: "MultiplatformBuildPlugin",
					executable: executable,
					arguments: [
						"xcframework"
						//					"-p",
						//					projectRoot.string,
						//					"assembleReleaseXCFrameworkForSPM"
					],
					environment: [

					],
					outputFilesDirectory: context.pluginWorkDirectory
				)
			]
		}
	}
}
