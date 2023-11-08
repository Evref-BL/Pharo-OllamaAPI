# Pharo-OllamaAPI

This is a simple API to call the [Ollama API](https://github.com/jmorganca/ollama/blob/main/docs/api.md)

> You must first install [Ollama](https://ollama.ai/) on your computer

## Example

```st
ollama := OllamaAPI new.
ollama model: OCodeLlamaModel new.
ollama model tag: '13b-code'.
ollama stream: false.

ollama query: '<PRE> def compute_gcd(x, y): <SUF>return result <MID>'
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
