Return-Path: <virtio-comment-return-5836-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AAC77B75
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 10:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 64CB1F3EA0
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 10:10:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DC8098639F
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 10:10:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C001983E8E; Mon,  8 May 2023 10:10:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A41B986298
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 May 2023 10:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: avF04k1xOoSnFy-iuWQRwQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 virtio-comment@lists.oasis-open.org
In-Reply-To: <75b978fc-b6e8-e0ec-c6eb-5a695214c921@opensynergy.com>
Organization: Red Hat GmbH
References: <20230313041116.126953-1-peter.hilber@opensynergy.com>
 <87zg76k9sr.fsf@redhat.com>
 <75b978fc-b6e8-e0ec-c6eb-5a695214c921@opensynergy.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 08 May 2023 12:10:40 +0200
Message-ID: <87ttwncevz.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rtc: Add device specification.

On Wed, Apr 26 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:

> On 17.04.23 13:49, Cornelia Huck wrote:
>> On Mon, Mar 13 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>>> +VIRTIO_RTC_S_DEVERR indicates that the device encountered an error while
>>> +executing the request, which could not be attributed to invalid input
>>> +from the driver.
>>
>> Is there any way for the driver to find out whether the request has
>> partially been executed, and whether it should retry?
>
> Maybe this could be changed to say that
>
>     ... the device did not execute the request due to an error which was
>     not caused by invalid input from the driver.

Ok, that looks clearer.

>
> As for retrying: Should there be an additional status code? IMHO this
> would increase complexity without a clear benefit. Could the device not
> retry internally if immediate retrying makes sense at the particular
> point in time?

I guess that depends on the request; the device should probably not
report an error to the driver if it can recover/retry itself. If we
can't think of any request that actually require the driver to do the
retry itself, we can ignore that for now.

>
>>
>>> +
>>> +All \field{reserved} fields are written as zero, and their value is
>>> +ignored.
>>> +
>>> +The set of clocks does not change after feature negotiation completion,
>>> +until device reset. The set of clocks should not change on device reset
>>> +either (similar to negotiated features). Clock identifiers are
>>> +zero-based, dense indices. All fields named \field{clock_id} contain
>>> +clock identifiers.
>>> +
>>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_OK if the device successfully
>>> +executed the request.
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_UNSUPP if the device could not
>>> +execute the specific request due to an implementation limitation.
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
>>> +of the \field{message_type} field which is neither described in this
>>> +specification nor otherwise known to the implementation.
>>
>> Should any such implementation limitations be guarded via feature bits?
>> I.e. can we drop _UNSUPP if we require features to be negotiated (and
>> per-clock capabilites being clearly communicated)?
>>
>
> All new message types should be guarded by feature bits, of course. By
> mistake, I added the `nor otherwise known to the implementation` suffix
> to the requirement above; I will remove it.
>
> What would dropping _UNSUPP mean? I think there should still be an error
> status in this case, regardless of whether the driver was compliant or
> not.
>
> But I think I should change the spec draft so that there will be no
> _UNSUPP statuses if both driver and device are compliant (and if the
> driver does not choose to ignore the actual device capabilities). For
> this, only one change should be required: Add a VIRTIO_RTC_M_CROSS_CAP
> message, through which the driver can determine whether the device
> supports cross-timestamping for a particular pair of clock and HW
> counter.

That sounds good to me.

>
> (Also, the field name should read `msg_type`, not `message_type`.)
>
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
>>> +of the \field{hw_counter} field which is neither described in this
>>> +specification nor otherwise known to the implementation.
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_NODEV if the \field{clock_id} field
>>> +value supplied with the message request does not identify a clock.
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_INVAL if the request values are not
>>> +allowed by the specification and none of the previous requirements in
>>> +this document stipulated another \field{status}.
>>
>> I think we can drop this (see above).
>>
>
> Again, I would still consider a non-OK status helpful for error handling
> and diagnostic purposes.

Ok, I don't really object to that.

>
>>> +
>>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>>> +\field{status} field to VIRTIO_RTC_S_INVAL if the device read-only part
>>> +of the message is too small.
>>
>> (...)
>>
>>> +\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
>>> +identified by the \field{clock_id} field.
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
>>> +
>>> +struct virtio_rtc_req_clock_cap {
>>> +	struct virtio_rtc_req_head head;
>>> +	__u8 reserved[4];
>>> +	__le64 clock_id;
>>> +};
>>> +
>>> +struct virtio_rtc_resp_clock_cap {
>>> +	struct virtio_rtc_resp_head head;
>>> +	__le16 type;
>>> +	__u8 reserved[10];
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +The \field{type} field identifies the clock type. A device provides
>>> +zero or more clocks for a clock type. The following clock types are
>>> +defined:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_RTC_CLOCK_UTC 0
>>> +#define VIRTIO_RTC_CLOCK_TAI 1
>>> +#define VIRTIO_RTC_CLOCK_MONO 2
>>> +\end{lstlisting}
>>> +
>>> +VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
>>> +standard. The device uses the time epoch of January 1, 1970, 00:00
>>> +UTC. This is the same epoch as \emph{Unix time}.
>>> +
>>> +VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
>>> +standard. The device uses the time epoch of January 1, 1970, 00:00
>>> +TAI.
>>> +
>>> +VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
>>> +subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
>>> +epoch is before or during device reset.
>>> +
>>> +Additional clock types may be standardized in the future.
>>> +Implementation-specific clock type definitions are not recommended and
>>> +use a clock type id greater than or equal to 0xF000.
>>
>> Could this command return capabilities in addition to the type?
>> E.g. indicate whether a clock supports cross-timestamping?
>
> Yes. But cross-timestamping will typically only be requested by the
> driver, and supported by the device, for specific HW counters. So I
> think this would be better indicated with a new VIRTIO_RTC_M_CROSS_CAP
> message (as discussed in the previous to last reply).
>
> An additional `capabilities` field may be added with the next iteration
> of the spec, which should add more features.

Sounds good!


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

