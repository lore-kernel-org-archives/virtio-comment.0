Return-Path: <sgarzare@redhat.com>
Date: Mon, 13 Jun 2022 14:51:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Message-ID: <20220613125135.cjhrxsv7hvsggqf6@sgarzare-redhat>
References: <20220613104038.22010-1-lauralg@amazon.com>
 <87leu0srxq.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87leu0srxq.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jun 13, 2022 at 01:50:41PM +0200, Cornelia Huck wrote:
>On Mon, Jun 13 2022, Laura Loghin <lauralg@amazon.com> wrote:
>
>> Added a new field to the vsock device config space that
>> is limiting the size of the packet payload. This way
>> the driver is not allowed to allocate huge buffers, and
>> potentially fill up the entire memory.
>> Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
>> in order to keep backwards compatibility.
>>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/140
>>
>> Signed-off-by: Laura Loghin <lauralg@amazon.com>
>> ---
>>  conformance.tex  |  2 ++
>>  virtio-vsock.tex | 24 ++++++++++++++++++++++++
>>  2 files changed, 26 insertions(+)
>
>I think you dropped Stefano's R-b by accident -- Stefano, I guess it
>still holds? (I can readd when merging).

Yep, thanks for CCing me!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>Looks good to me now; if nobody else has any comments, we can start voting.
>
>>
>> diff --git a/conformance.tex b/conformance.tex
>> index 42f8537..77f7583 100644
>> --- a/conformance.tex
>> +++ b/conformance.tex
>> @@ -222,6 +222,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  A socket driver MUST conform to the following normative statements:
>>
>>  \begin{itemize}
>> +\item \ref{drivernormative:Device Types / Socket Device / Device configuration layout}
>>  \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
>>  \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
>>  \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Device Events}
>> @@ -481,6 +482,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>  A socket device MUST conform to the following normative statements:
>>
>>  \begin{itemize}
>> +\item \ref{devicenormative:Device Types / Socket Device / Device configuration layout}
>>  \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
>>  \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
>>  \end{itemize}
>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> index d79984d..5db6110 100644
>> --- a/virtio-vsock.tex
>> +++ b/virtio-vsock.tex
>> @@ -23,6 +23,10 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>>  \begin{description}
>>  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>> +\item[VIRTIO_VSOCK_F_SIZE_MAX (2)] Maximum size of the packet payload is in
>> +	\field{data_max_size}. If offered by the device, device advises driver
>> +	about the value of its maximum payload size. If negotiated, the driver uses
>> +	\field{data_max_size} as the maximum packet payload size value.
>>  \end{description}
>>
>>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>> @@ -32,6 +36,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>>  \begin{lstlisting}
>>  struct virtio_vsock_config {
>>  	le64 guest_cid;
>> +	le32 data_max_size;
>>  };
>>  \end{lstlisting}
>>
>> @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>>  \hline
>>  \end{tabular}
>>
>> +The following driver-read-only field, \field{data_max_size} only exists if
>> +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet payload
>> +size for the driver to use.
>> +
>> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> +
>> +The device MUST NOT change the value exposed through \field{data_max_size}.
>> +
>> +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> +
>> +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
>> +
>> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
>> +supplies for a packet MUST have a total size that doesn't exceed the size
>> +\field{data_max_size} (plus header length).
>> +
>> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
>> +of size exceeding the value of \field{data_max_size} (plus header length).
>> +
>>  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>>
>>  \begin{enumerate}
>

