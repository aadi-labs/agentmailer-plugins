pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendWhatsappContentButtonsButtonsItem {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub title: String,
}

impl ChannelMessageSendWhatsappContentButtonsButtonsItem {
    pub fn builder() -> ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder {
        <ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder {
    id: Option<String>,
    title: Option<String>,
}

impl ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn title(mut self, value: impl Into<String>) -> Self {
        self.title = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendWhatsappContentButtonsButtonsItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder::id)
    /// - [`title`](ChannelMessageSendWhatsappContentButtonsButtonsItemBuilder::title)
    pub fn build(self) -> Result<ChannelMessageSendWhatsappContentButtonsButtonsItem, BuildError> {
        Ok(ChannelMessageSendWhatsappContentButtonsButtonsItem {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            title: self
                .title
                .ok_or_else(|| BuildError::missing_field("title"))?,
        })
    }
}
