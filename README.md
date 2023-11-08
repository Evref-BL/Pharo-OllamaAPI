# Pharo-OllamaAPI

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
