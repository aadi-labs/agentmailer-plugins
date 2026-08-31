//! Service clients and API endpoints
//!
//! This module contains client implementations for:
//!
//! - **agent**
//! - **inboxes**
//! - **messages**
//! - **threads**
//! - **drafts**
//! - **attachments**
//! - **pods**
//! - **domains**
//! - **webhooks**
//! - **labels**
//! - **lists**
//! - **events**
//! - **billing**
//! - **a2a**

use crate::{ApiError, ClientConfig};

pub mod a2a;
pub mod agent;
pub mod attachments;
pub mod billing;
pub mod domains;
pub mod drafts;
pub mod events;
pub mod inboxes;
pub mod labels;
pub mod lists;
pub mod messages;
pub mod pods;
pub mod threads;
pub mod webhooks;
pub struct AgentMailer {
    pub config: ClientConfig,
    pub agent: AgentClient,
    pub inboxes: InboxesClient,
    pub messages: MessagesClient,
    pub threads: ThreadsClient,
    pub drafts: DraftsClient,
    pub attachments: AttachmentsClient,
    pub pods: PodsClient,
    pub domains: DomainsClient,
    pub webhooks: WebhooksClient,
    pub labels: LabelsClient,
    pub lists: ListsClient,
    pub events: EventsClient,
    pub billing: BillingClient,
    pub a2a: A2AClient,
}

impl AgentMailer {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            config: config.clone(),
            agent: AgentClient::new(config.clone())?,
            inboxes: InboxesClient::new(config.clone())?,
            messages: MessagesClient::new(config.clone())?,
            threads: ThreadsClient::new(config.clone())?,
            drafts: DraftsClient::new(config.clone())?,
            attachments: AttachmentsClient::new(config.clone())?,
            pods: PodsClient::new(config.clone())?,
            domains: DomainsClient::new(config.clone())?,
            webhooks: WebhooksClient::new(config.clone())?,
            labels: LabelsClient::new(config.clone())?,
            lists: ListsClient::new(config.clone())?,
            events: EventsClient::new(config.clone())?,
            billing: BillingClient::new(config.clone())?,
            a2a: A2AClient::new(config.clone())?,
        })
    }
}

pub use a2a::A2AClient;
pub use agent::AgentClient;
pub use attachments::AttachmentsClient;
pub use billing::BillingClient;
pub use domains::DomainsClient;
pub use drafts::DraftsClient;
pub use events::EventsClient;
pub use inboxes::InboxesClient;
pub use labels::LabelsClient;
pub use lists::ListsClient;
pub use messages::MessagesClient;
pub use pods::PodsClient;
pub use threads::ThreadsClient;
pub use webhooks::WebhooksClient;
