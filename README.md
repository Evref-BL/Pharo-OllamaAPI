# Pharo-OllamaAPI

[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://github.com/pharo-project/pharo)
[![Moose version](https://img.shields.io/badge/Moose-12-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

This is a simple API to call the [Ollama API](https://github.com/jmorganca/ollama/blob/main/docs/api.md)

> You must first install [Ollama](https://ollama.ai/) on your computer

## Example

### Generate code with CodeLlama

```st
ollama := OllamaAPI new.
ollama model: OCodeLlamaModel new.
ollama model tag: '7b-code'.
ollama temperature: 0.1.
ollama num_predict: 30.
ollama top_p: 0.5.

ollama query: '<PRE><body>
    <!-- here a table -->
    <SUF>
</body><MID>'
```

### Generate a comment code with CodeLlama

```st
ollama := OllamaAPI new.
ollama model: OCodeLlamaModel new.
ollama model tag: '7b'.
ollama temperature: 0.5.
ollama num_predict: 75.
ollama top_p: 0.5.

ollama query: 'Writte a comment that explain this function

<yourcode>'
```

### Use the stream API

```st
[ollama := OllamaAPI new.
ollama model: OCodeLlamaModel new.
ollama model tag: '7b'.
ollama temperature: 0.5.
ollama num_predict: 100.
ollama top_p: 0.5.
ollama stream: true.

answer := ollama query: 'Hello world'.
reader := NeoJSONReader on: (ZnCharacterReadStream on: answer).
[ reader atEnd ] whileFalse: [
	| val |
	val := reader next.
	Transcript crShow: (val at: #response).
	(val at: #done) ifTrue: [ answer close ] ]] forkAt: Processor lowIOPriority
```

## Installation

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Pharo-OllamaAPI' commitish: 'main' path: 'src';
  baseline: 'PharoOllama';
  load
```

### As a dependency

```st
spec
  baseline: 'PharoOllama'
  with: [
  spec repository: 'github://Evref-BL/Pharo-OllamaAPI:main/src' ]
```
