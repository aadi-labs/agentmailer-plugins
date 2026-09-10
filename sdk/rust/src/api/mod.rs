//! API client and types for the AgentMailer API
//!
//! This module contains all the API definitions including request/response types
//! and client implementations for interacting with the API.
//!
//! ## Modules
//!
//! - [`resources`] - Service clients and endpoints
//! - [`types`] - Request, response, and model types

pub mod resources;
pub mod types;

pub use resources::{
    A2AClient, AgentClient, AgentMailer, AttachmentsClient, BillingClient, DomainsClient,
    DraftsClient, EventsClient, InboxesClient, LabelsClient, ListsClient, MessagesClient,
    PodsClient, ThreadsClient, WebhooksClient,
};
pub use types::*;
