export interface Couch {
    compareBig(a: number, b: number): number;
    tryMarkdown2Json(markdown: string): string;
}

export function runCouch(url: string): Promise<Couch>;