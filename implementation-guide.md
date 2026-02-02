# Implementation Guide

Principles for building and extending the apparatus and its consumer projects. These are recurring decisions that should not need to be re-derived each session.

## Design principles

1. **Apparatus is opinionated.** Adopting it means getting all of it. Consumer projects conform to apparatus, not the other way around.

2. **Configurability must be justified, not assumed.** Do not add options, feature flags, or extension points speculatively. Every configuration surface is a maintenance burden and a decision deferred. Add configurability only when a concrete, demonstrated need requires it.
