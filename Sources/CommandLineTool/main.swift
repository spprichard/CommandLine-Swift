import CommandLineToolCore

let tool = CommandLineTool()

do {
    try tool.run()
} catch {
    print("Something went wrong...")
}
