import os

type RuntimeSettings* = object
  baseDir*: string
  debug*: bool
  background*: bool

proc initRuntimeSetting*(): RuntimeSettings =
  result.baseDir = getHomeDir() / ".local/share/nicoru"

proc shortId*(imageId: string): string =
  return imageId[7 .. ^1]

proc imagesPath*(settings: RuntimeSettings): string =
  return settings.baseDir / "images"

proc databasePath*(settings: RuntimeSettings): string =
  return settings.imagesPath() / "repositories.json"

proc imagesHashPath*(settings: RuntimeSettings): string =
  return settings.imagesPath() / "sha256"

proc imagesHashPath*(settings: RuntimeSettings, blob: string): string =
  return settings.imagesHashPath() / shortId(blob)

proc blobPath*(settings: RuntimeSettings): string =
  return settings.baseDir / "blobs"

proc blobPath*(settings: RuntimeSettings, imageId: string): string =
  return settings.blobPath() / shortId(imageId)

proc containersPath*(settings: RuntimeSettings): string =
  return settings.baseDir / "containers"

proc layerPath*(settings: RuntimeSettings): string =
  return settings.baseDir / "layer"

proc layerPath*(settings: RuntimeSettings, blob: string): string =
  return settings.baseDir / "layer" / shortId(blob)

proc containerConfigPath*(settings: RuntimeSettings): string =
  return settings.containersPath() / "config.json"
