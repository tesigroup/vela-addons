#!/usr/bin/env -S deno run --allow-env --allow-read --allow-run --allow-write

import { $, modDir, path } from "../../.devcontainer/scripts/shared.ts";
import { parse, stringify } from "https://deno.land/std@0.202.0/yaml/mod.ts";
import { z } from "https://deno.land/x/zod@v3.22.4/mod.ts";

const homeURI = "https://github.com/tesigroup/vela-addons";

const Metadata = z
  .object({
    description: z.string(),
    icon: z.string(),
    name: z.string(),
    version: z.string(),
  })
  .passthrough();

interface Chart {
  apiVersion: "v2";
  description: string;
  home: typeof homeURI;
  name: string;
  type: "application";
  version: string;
  [key: string]: unknown;
}

const addonsPath = path.join(modDir(import.meta), "..", "charts");

for await (const dirEntry of Deno.readDir(addonsPath)) {
  try {
    const metadataPath = path.join(addonsPath, dirEntry.name, "metadata.yaml");
    const chartPath = path.join(addonsPath, dirEntry.name, "Chart.yaml");
    const stat = await Deno.stat(metadataPath);
    if (stat.isFile) {
      const content = await Deno.readTextFile(metadataPath);
      const parseResult = Metadata.safeParse(parse(content));
      if (!parseResult.success) {
        $`echo ${`Unable to parse metadata ${parseResult.error.toString()}`}`;
        continue;
      }
      const metadata = parseResult.data;
      const chart: Chart = {
        apiVersion: "v2",
        description: metadata.description,
        home: homeURI,
        name: metadata.name,
        type: "application",
        version: metadata.version,
      };
      await Deno.writeTextFile(chartPath, stringify(chart));
    }
  } catch (error) {
    if (error instanceof Deno.errors.NotFound) {
      continue;
    }
    throw error;
  }
}
