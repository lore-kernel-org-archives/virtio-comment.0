Return-Path: <virtio-comment-return-5496-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251B0C77B70
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 11:50:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6E1B968467
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 11:50:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56E5C9863C0
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 11:50:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4352D98632B; Mon, 17 Apr 2023 11:50:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 551CC98634A
	for <virtio-comment@lists.oasis-open.org>; Mon, 17 Apr 2023 11:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: USTpt44MPZm39LVRo-AWKg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
In-Reply-To: <20230313041116.126953-1-peter.hilber@opensynergy.com>
Organization: Red Hat GmbH
References: <20230313041116.126953-1-peter.hilber@opensynergy.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 17 Apr 2023 13:49:56 +0200
Message-ID: <87zg76k9sr.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rtc: Add device specification.

On Mon, Mar 13 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:

> This is a partial draft for a Real-Time Clock (RTC) device. The
> virtio-rtc device provides information about current time through one or
> more clocks.
>
> It is planned to add a timer/alarm feature as part of a draft spec
> update.
>
> The draft uses the "Timer/Clock" device id which is already part of the
> specification. This device id was registered a long time ago and should
> be unused according to the author's information. The name "RTC" was
> determined to be the best for a device which focuses on current time,
> but is up to discussion.
>
> For this device, there is a prototypical Linux kernel driver for which
> upstreaming is planned, and a proprietary device implementation.
>
> In the spec text, there is some redundancy between the informative and
> the normative text. The intent is that the informative text already
> gives all the essential information about the device.
>
> In the spec, clock ids are 64 bit wide to have unique ids when
> supporting clock hot-plugging in the future.
>
> Any feedback is appreciated very much.
>
> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
> ---
>  conformance.tex                         |   2 +
>  content.tex                             |   3 +-
>  device-types/rtc/description.tex        | 523 ++++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |  10 +
>  device-types/rtc/driver-conformance.tex |   9 +
>  5 files changed, 546 insertions(+), 1 deletion(-)
>  create mode 100644 device-types/rtc/description.tex
>  create mode 100644 device-types/rtc/device-conformance.tex
>  create mode 100644 device-types/rtc/driver-conformance.tex

(...)

> +VIRTIO_RTC_S_INVAL indicates that
> +
> +\begin{itemize}
> +\item the driver request values are not allowed by the specification or

Do we need to specify that, as such a driver would be non-conforming
anyway?

> +\item the device read-only part of the message, or device write-only
> +	part of the message, is too small.
> +\end{itemize}
> +
> +VIRTIO_RTC_S_DEVERR indicates that the device encountered an error while
> +executing the request, which could not be attributed to invalid input
> +from the driver.

Is there any way for the driver to find out whether the request has
partially been executed, and whether it should retry?

> +
> +All \field{reserved} fields are written as zero, and their value is
> +ignored.
> +
> +The set of clocks does not change after feature negotiation completion,
> +until device reset. The set of clocks should not change on device reset
> +either (similar to negotiated features). Clock identifiers are
> +zero-based, dense indices. All fields named \field{clock_id} contain
> +clock identifiers.
> +
> +\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_OK if the device successfully
> +executed the request.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_UNSUPP if the device could not
> +execute the specific request due to an implementation limitation.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
> +of the \field{message_type} field which is neither described in this
> +specification nor otherwise known to the implementation.

Should any such implementation limitations be guarded via feature bits?
I.e. can we drop _UNSUPP if we require features to be negotiated (and
per-clock capabilites being clearly communicated)?

> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
> +of the \field{hw_counter} field which is neither described in this
> +specification nor otherwise known to the implementation.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_NODEV if the \field{clock_id} field
> +value supplied with the message request does not identify a clock.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_INVAL if the request values are not
> +allowed by the specification and none of the previous requirements in
> +this document stipulated another \field{status}.

I think we can drop this (see above).

> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_INVAL if the device read-only part
> +of the message is too small.

(...)

> +\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
> +identified by the \field{clock_id} field.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
> +
> +struct virtio_rtc_req_clock_cap {
> +	struct virtio_rtc_req_head head;
> +	__u8 reserved[4];
> +	__le64 clock_id;
> +};
> +
> +struct virtio_rtc_resp_clock_cap {
> +	struct virtio_rtc_resp_head head;
> +	__le16 type;
> +	__u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +The \field{type} field identifies the clock type. A device provides
> +zero or more clocks for a clock type. The following clock types are
> +defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_CLOCK_UTC 0
> +#define VIRTIO_RTC_CLOCK_TAI 1
> +#define VIRTIO_RTC_CLOCK_MONO 2
> +\end{lstlisting}
> +
> +VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
> +standard. The device uses the time epoch of January 1, 1970, 00:00
> +UTC. This is the same epoch as \emph{Unix time}.
> +
> +VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
> +standard. The device uses the time epoch of January 1, 1970, 00:00
> +TAI.
> +
> +VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
> +subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
> +epoch is before or during device reset.
> +
> +Additional clock types may be standardized in the future.
> +Implementation-specific clock type definitions are not recommended and
> +use a clock type id greater than or equal to 0xF000.

Could this command return capabilities in addition to the type?
E.g. indicate whether a clock supports cross-timestamping?

> +
> +\end{description}

(...)

> +\drivernormative{\paragraph}{readq Operation}{Device Types / RTC Device / Device Operation / readq Operation}
> +
> +The driver MUST put the request into the device-readable part of the
> +readq message.
> +
> +The driver MUST allocate enough space for the response in the
> +device-writable part of the readq message.
> +
> +If VIRTIO_RTC_F_READ_CROSS was not negotiated, the driver MUST NOT send
> +the VIRTIO_RTC_M_READ_CROSS message.

There seems to be some dislike for doubly-negated statements, what
about:

"The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
VIRTIO_RTC_M_READ_CROSS message."

(...)

Generally, looks reasonable to me, but I'm not that familiar with clocks
and would appreciate if someone else took a look as well.


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

