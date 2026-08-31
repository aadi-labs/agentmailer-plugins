pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum A2ATaskStatusState {
    TaskStateSubmitted,
    TaskStateWorking,
    TaskStateCompleted,
    TaskStateFailed,
    TaskStateCanceled,
    TaskStateInputRequired,
    TaskStateRejected,
    TaskStateAuthRequired,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for A2ATaskStatusState {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::TaskStateSubmitted => serializer.serialize_str("TASK_STATE_SUBMITTED"),
            Self::TaskStateWorking => serializer.serialize_str("TASK_STATE_WORKING"),
            Self::TaskStateCompleted => serializer.serialize_str("TASK_STATE_COMPLETED"),
            Self::TaskStateFailed => serializer.serialize_str("TASK_STATE_FAILED"),
            Self::TaskStateCanceled => serializer.serialize_str("TASK_STATE_CANCELED"),
            Self::TaskStateInputRequired => serializer.serialize_str("TASK_STATE_INPUT_REQUIRED"),
            Self::TaskStateRejected => serializer.serialize_str("TASK_STATE_REJECTED"),
            Self::TaskStateAuthRequired => serializer.serialize_str("TASK_STATE_AUTH_REQUIRED"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for A2ATaskStatusState {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "TASK_STATE_SUBMITTED" => Ok(Self::TaskStateSubmitted),
            "TASK_STATE_WORKING" => Ok(Self::TaskStateWorking),
            "TASK_STATE_COMPLETED" => Ok(Self::TaskStateCompleted),
            "TASK_STATE_FAILED" => Ok(Self::TaskStateFailed),
            "TASK_STATE_CANCELED" => Ok(Self::TaskStateCanceled),
            "TASK_STATE_INPUT_REQUIRED" => Ok(Self::TaskStateInputRequired),
            "TASK_STATE_REJECTED" => Ok(Self::TaskStateRejected),
            "TASK_STATE_AUTH_REQUIRED" => Ok(Self::TaskStateAuthRequired),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for A2ATaskStatusState {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::TaskStateSubmitted => write!(f, "TASK_STATE_SUBMITTED"),
            Self::TaskStateWorking => write!(f, "TASK_STATE_WORKING"),
            Self::TaskStateCompleted => write!(f, "TASK_STATE_COMPLETED"),
            Self::TaskStateFailed => write!(f, "TASK_STATE_FAILED"),
            Self::TaskStateCanceled => write!(f, "TASK_STATE_CANCELED"),
            Self::TaskStateInputRequired => write!(f, "TASK_STATE_INPUT_REQUIRED"),
            Self::TaskStateRejected => write!(f, "TASK_STATE_REJECTED"),
            Self::TaskStateAuthRequired => write!(f, "TASK_STATE_AUTH_REQUIRED"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
