Return-Path: <virtio-comment-return-3305-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45BB4986581
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 Aug 2022 11:59:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220803071725-mutt-send-email-mst@kernel.org>
References: <20220803084441.1206034-1-keirf@google.com>
 <20220803071725-mutt-send-email-mst@kernel.org>
Date: Wed, 03 Aug 2022 13:59:28 +0200
Message-ID: <87k07p8rmn.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] virtio-balloon: add an untrusted
 device feature
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>, Keir Fraser <keirf@google.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Aug 03 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Aug 03, 2022 at 08:44:41AM +0000, Keir Fraser wrote:

[hmm... I don't see the original mail on virtio-comment]

>> Add a feature bit to indicate that guest memory is protected from the
>> host by the Trusted Compyuting Base (TCB).
>
> Typo.
>
>> This flag indicates to the
>> driver that memory ownership must be relinquished via the TCB, by
>> platform-specific means, before reporting that memory to the device.
>
> Thanks for the proposal! I feel it needs to be more detailed to be
> useful. In particular we need a bit more info about TCB and memory
> ownership here I feel, so people can interpret this. Is there a spec
> link?
>
>> 
>> Signed-off-by: Keir Fraser <keirf@google.com>
>> ---
>>  content.tex | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>> 
>> diff --git a/content.tex b/content.tex
>> index e863709..1575ab7 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -5543,6 +5543,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
>>      Configuration field \field{poison_val} is valid.
>>  \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
>>      page reporting. A virtqueue for reporting free guest memory is present.
>> +\item[ VIRTIO_BALLOON_F_UNTRUSTED_DEVICE(6) ] The driver must
>> +    relinquish memory ownership via the Trusted Computing Base (TCB) before
>> +    notifying the device.
>
> The name does not seem to match what it does.
>
>>  
>>  \end{description}
>>  
>> @@ -5558,11 +5561,22 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
>>  it MUST NOT accept VIRTIO_BALLOON_F_PAGE_REPORTING unless it also
>>  negotiates VIRTIO_BALLOON_F_PAGE_POISON.
>>  
>> +The driver SHOULD accept the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE
>> +feature if offered by the device, and relinquish memory ownership via
>> +the TCB by platform-specific means.
>> +
>>  \devicenormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
>>  If the device offers the VIRTIO_BALLOON_F_MUST_TELL_HOST feature
>>  bit, and if the driver did not accept this feature bit, the
>>  device MAY signal failure by failing to set FEATURES_OK
>>  \field{device status} bit when the driver writes it.
>> +
>> +If guest memory is protected from the host,
>
> This does not make it clear how this is different from VIRTIO_F_ACCESS_PLATFORM
> which says:
>
> \item[VIRTIO_F_ACCESS_PLATFORM(33)] This feature indicates that
>   the device can be used on a platform where device access to data
>   in memory is limited and/or translated.

I'm also wondering how this relates to existing secure/existing
techniques that basically mandate ACCESS_PLATFORM. Does this new feature
require ACCESS_PLATFORM as well?

>
>
>
>
>> the device must offer the
>
> MUST
>
>> +VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature bit. If the driver does
>> +not accept this feature bit, the device MUST signal failure by failing
>> +to set FEATURES_OK \field{device status} bit when the driver writes
>> +it.

So, the bit is mandatory if offered?

>> +
>>  \subparagraph{Legacy Interface: Feature bits}\label{sec:Device
>>  Types / Memory Balloon Device / Feature bits / Legacy Interface:
>>  Feature bits}
>> @@ -5573,6 +5587,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
>>  allow guest to use memory before notifying host if
>>  VIRTIO_BALLOON_F_MUST_TELL_HOST is not negotiated.
>>  
>> +The legacy interface cannot support VIRTIO_BALLOON_F_UNTRUSTED_DEVICE
>> +since there is no way to gracefully report feature negotiation failure.

UNTRUSTED_DEVICE requires VERSION_1, then?

>> +
>>  \subsection{Device configuration layout}\label{sec:Device Types / Memory Balloon Device / Device configuration layout}
>>    \field{num_pages} and \field{actual} are always available.
>>  
>> @@ -5647,6 +5664,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
>>      pages. These addresses are divided by 4096\footnote{This is historical, and independent of the guest page size.
>>  } and the descriptor
>>      describing the resulting 32-bit array is added to the inflateq.
>> +  \item If the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature has been
>> +  negotiated, the driver MUST relinquish memory ownership via the TCB
>> +  before adding it to the inflateq.

Do we need a definition of "relinquish memory ownership"?

>> +
>>    \end{enumerate}
>>  
>>  \item To remove memory from the balloon (aka. deflate):
>
> Don't we need to take it back before deflate?
>
>
>> @@ -6105,6 +6126,9 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
>>  driver MUST initialize all free pages with \field{poison_val} before
>>  reporting them.
>>  
>> +If the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature has been negotiated, the
>> +driver MUST notify free pages to the TCB before reporting them.
>> +
>>  The driver MUST NOT use the reported pages until the device has
>>  acknowledged the reporting request.
>
> Should this affect hinting too?
>
> Is "notify" same as "relinquish ownership"?
>
> Are these terms defined in some spec?


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

